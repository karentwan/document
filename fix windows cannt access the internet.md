#  windows不能上网
查看网络状态和任务的时候发现，上面显示：依赖服务或组无法启动
## 原因
Winsock2损坏
## 解决办法
1. 运行->services.sec
2. 找到服务` windows Biometric Service`,然后手动启动它
