#  windows不能上网
查看网络状态和任务的时候发现，上面显示：依赖服务或组无法启动
## 原因
Winsock2损坏
## 解决办法
1. 运行->services.sec
2. 找到服务` windows Biometric Service`,然后手动启动它
#  删注册表的方式来解决mathtype试用问题
mathtype一旦试用期到了直接重接并不能接着试用，因为它会在注册表留下痕迹，只要删掉注册表然后重装就可以接着试用，注册表的位置如下

```
HKEY_CURRENT_USER/Software/Install Option/
```
展开上面的注册表就可以看到mathtype在上面留下的痕迹，只要将其删除，就可以重新试用