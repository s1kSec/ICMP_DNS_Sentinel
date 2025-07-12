ICMP_DNS_Sentinel是一个针对ICMP/DNS隧道的检测工具，例如ICMP报文是由系统内核处理的，不占用任何端口，因此具有很高的隐蔽性。在应急响应过程中只有通过流量包来分析，无法定位到恶意文件，此项目在bpftrace基础上提供一个过滤器来捕获ICMP/DNS流量得到恶意的软件包路径

本项目参考了：NOP Team的文章
本质也是对上文代码的整合优化，无需skbuff库，避免了复杂环境下的导库函数操作
代码透明无后门操作


Usage：./ICMP_DNS_Sentinel.sh <<目标IP>>
ICMP隧道：
<img width="1331" height="1024" alt="image" src="https://github.com/user-attachments/assets/3cf31df0-0de6-4215-9d77-8078e410c13b" />

DNS隧道模拟：
<img width="1150" height="918" alt="image" src="https://github.com/user-attachments/assets/c5b23577-d855-4f33-b7e2-2c12df0a8a7f" />
