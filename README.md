## Language

- [English](#english)
- [中文](#中文)

---

### English

# ICMP_DNS_Sentinel
A detection tool for ICMP/DNS tunnels, such as ICMP messages, is processed by the system kernel and does not occupy any ports, so it has high concealment. In the process of emergency response, malicious files cannot be located only by analyzing traffic packets. This project provides a filter based on bpftrace to capture ICMP/DNS traffic and get malicious software package paths.

This project refers to the article of NOP Team.
https://mp.weixin.qq.com/s/nyRkB_3lgsjZtMNwNuCpoA

The essence is also the integration and optimization of the above code, without skbuff library, which avoids the operation of library function in complex environment.
Code transparent and backdoor-free operation

### Dependency
You need to install bpftrace.
```bash
sudo apt update
sudo apt install bpftrace
```


### Usage：
```bash
./ICMP_DNS_Sentinel.sh << Target IP >>
```

ICMP tunnel：

<img width="1834" height="1360" alt="image" src="https://github.com/user-attachments/assets/f0d50757-0b62-4419-aab1-627f4b7bd53b" />


DNS Tunnel simulation：

<img width="1834" height="1360" alt="image" src="https://github.com/user-attachments/assets/a8d2aba6-ecb8-42de-b317-9639db2d3b69" />


---

### 中文

ICMP_DNS_Sentinel是一个针对ICMP/DNS隧道的检测工具，例如ICMP报文是由系统内核处理的，不占用任何端口，因此具有很高的隐蔽性。在应急响应过程中只有通过流量包来分析，无法定位到恶意文件，此项目在bpftrace基础上提供一个过滤器来捕获ICMP/DNS流量得到恶意的软件包路径

本项目参考了：NOP Team的文章 本质也是对上文代码的整合优化，无需skbuff库，避免了复杂环境下的导库函数操作
代码透明无后门操作

### 依赖项
您需要安装bpftrace
```bash
sudo apt update
sudo apt install bpftrace
```

### Usage：
```bash
./ICMP_DNS_Sentinel.sh <<目标IP>>
```

ICMP隧道： 

<img width="1834" height="1360" alt="image" src="https://github.com/user-attachments/assets/f0d50757-0b62-4419-aab1-627f4b7bd53b" />

DNS隧道模拟：

<img width="1834" height="1360" alt="image" src="https://github.com/user-attachments/assets/a8d2aba6-ecb8-42de-b317-9639db2d3b69" />
