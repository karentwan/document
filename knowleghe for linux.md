# dpkg默认安装路径

```
/opt
```

# 显卡相关问题

安装显卡驱动后，开机后，一直卡在登录界面

按住ctrl+alt+F1键后切换到纯控制台后，输入`nividia-smi`显示报错信息：

```
nvidia-smi has failed because it counldn't communicate with the NVIDIA driver
```

- 解决方法1：
	
step1:

```
sudo apt-get install dkms	
```

step2:

```
sudo dkms install -m nvidia -v 430.50
```

注意:-v后面的是安装的显卡驱动的版本号

- 解决方法2：

如果是因为linux的内核版本更新了后，导致显卡驱动和内核版本不匹配可以在系统开机的时候
选择老版本的内核即可
