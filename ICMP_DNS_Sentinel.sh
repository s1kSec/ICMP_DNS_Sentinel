#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "Root permission is required."
  exit 1
fi

if [ -z "$1" ]; then
  echo "usage: $0 <Target IP>"
  exit 1
fi

IP="$1"

echo "ICMP_DNS_Sentinel\nAuthor: s1kSec\n\n"

convert_ip_to_integers() {
  local ip=$1
  IFS='.' read -r a b c d <<< "$ip"
  be_ip_int=$((a << 24 | b << 16 | c << 8 | d))
  le_ip_int=$((d << 24 | c << 16 | b << 8 | a))
  echo "$be_ip_int $le_ip_int"
}

read big_endian little_endian <<< $(convert_ip_to_integers "$IP")

echo "Start listening for requests to $IP (BigEndian=$big_endian, LittleEndian=$little_endian)..."
echo ""

get_exe_path() {
  local pid=$1
  if [ -d "/proc/$pid" ]; then
    path=$(readlink -f "/proc/$pid/exe" 2>/dev/null)
    if [ -n "$path" ]; then
      echo "[-] exe_path=$path"
    else
      echo "[-] exe_path=(Permission denied)" 
    fi
  else
    echo "[-] exe_path=(Process $pid terminated)"
  fi
}

bpftrace -e '
kprobe:__dev_queue_xmit
{
  $daddr = ((struct iphdr *)(((struct sk_buff *)arg0)->head + ((struct sk_buff *)arg0)->network_header))->daddr;

  if ($daddr == '"$big_endian"' || $daddr == '"$little_endian"') {
    printf("[+] Found packet to IP: %s\n",
      ntop(2, $daddr)  // 2 = AF_INET
    );
    printf("[-] pid=%d, tid=%d, comm=%s\n", pid, tid, comm);
  }
}
' | while read -r line; do
  echo "$line" 
  if [[ $line == *"pid="* ]]; then
    pid=$(echo "$line" | grep -oP 'pid=\K\d+')
    get_exe_path "$pid"
  fi
done