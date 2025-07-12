# ICMP_DNS_Sentinel
A detection tool for ICMP/DNS tunnels, such as ICMP messages, is processed by the system kernel and does not occupy any ports, so it has high concealment. In the process of emergency response, malicious files cannot be located only by analyzing traffic packets. This project provides a filter based on bpftrace to capture ICMP/DNS traffic and get malicious software package paths.

This project refers to the article of NOP Team.
https://mp.weixin.qq.com/s/nyRkB_3lgsjZtMNwNuCpoA

The essence is also the integration and optimization of the above code, without skbuff library, which avoids the operation of library function in complex environment.
Code transparent and backdoor-free operation

Usage：./ICMP_DNS_Sentinel.sh <<Target IP>>
ICMP隧道：
<img width="1331" height="1024" alt="image" src="https://github.com/user-attachments/assets/43c6e9a3-9f51-4f43-b248-c4a709ba07b3" />
DNS隧道模拟：
<img width="1150" height="918" alt="image" src="https://github.com/user-attachments/assets/540bb9f4-3766-4cd0-a44f-8a446e02b10b" />
