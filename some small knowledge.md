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
# 命令激活windows
安装秘钥

```
slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 
```
**(上面的激活秘钥针对的是windows 家庭版 VOL)**
设置激活服务器

```
slmgr /skms zh.us.to
```
开始激活

```
slmgr /ato
```
# 命令激活office
进入安装目录

```
cd D:\software\office16\Office16
```
设置激活秘钥

```
cscript ospp.vbs /inpkey:TWCRT-QVNVH-XTKPM-BV2XX-QV7HC
```
设置激活服务器

```
cscript ospp.vbs /sethst:zh.us.to
```
激活
```
cscript ospp.vbs /act
```
