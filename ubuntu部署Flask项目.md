## 配置nginx

安装:

```
sudo apt-get install nginx
```
	
注意：nginx的主配置文件在`/etc/nginx/nginx.conf`里面，该配置文件有一行指令`include /etc/nginx/conf.d/*.conf`，意思是该

配置文件会读取所有存在于`/etc/nginx/conf.d`文件夹里面的以.conf结尾的配置文件。

因此我们只要将配置文件存放在`/etc/nginx/conf.d`文件夹里面就会被nginx读取

(注：nginx好像会默认创建一个用户叫做www-data)

创建一个配置文件
```
sudo vim /etc/nginx/conf.d/alpr_website_nginx.conf
```
内容如下:

```
server {
	listen      80;
	server_name 192.168.253.128;  # 这里如果配置成了localhost就不能被别的机器访问了
	
	# 静态转发
	location /static/ {
		alias /var/www/alpr-website/static/;
		autoindex on;
	}
	# 动态转发, 走应用服务器(uwsgi)
	location / { 
		include uwsgi_params;
		uwsgi_pass 127.0.0.1:5000;
		uwsgi_param UWSGI_PYTHON /home/wan/anaconda3/bin;
		uwsgi_param UWSGI_CHDIR /var/www/alpr-website;
		uwsgi_param UWSGI_SCRIPT app:app;
	}
}
```
修改配置后不用重启，直接重新加载配置文件即可，加载之前先检查配置文件有没有错误：

检查配置文件有没有错误:
```
sudo /usr/sbin/nginx -t
```
重新加载配置文件：
```
sudo /usr/sbin/nginx -s reload	
```
如果报403错误说明访问的资源没有权限，具体的意思是什么呢？

nginx会有一个worker进程，该进程的用户是www-data, 而该进程访问的文件是来自于/root/目录下面的。

因为/root/目录属于root用户，因此www-data是没有权限访问，因此会报403错误。
	
解决办法：可以将worker进程的用户也改为root, 即修改如下地方:
```
sudo vim /etc/nginx/nginx.conf
```
将第一行的`user www-data;`改成`user root;`

tricks: 当改变配置文件之后，不确定有没有被加载，可以使用将配置文件(例如将配置文件其中一行去掉分号)改错一个地方，

然后使用检查命令来提示，如果不报错说明没有被加载
	
nginx启动命令：`sudo /usr/sbin/nginx`

nginx的停止可以使用:
```
ps -ef | grep nginx  # 查看端口号
kill -s 9 PID
```

## 配置uwsgi
网站源码所需要运行的环境是依赖于anaconda里面的python环境的，因此需要将uwsgi安装到anaconda里面去

使用pip来安装uwsgi
	
首先，将gcc版本降级为4.7
```
sudo apt-get install gcc-4.7
sudo rm /usr/bin/gcc
sudo ln -s /usr/bin/gcc-4.7 /usr/bin/gcc
cd ~/anaconda3/bin
pip install uwsgi
```
上面通过pip安装的uwsgi会出现下面的问题：
```
libspcre.so.1:cannot open shared object file: No such file or directory
```
### 解决办法：

找出`libpcre.so.1`文件所在位置: `find / -name libpcre.so.1`

并将找到的`libpcre.so.1`文件链接到`/lib64`和`/lib`里面: 
```
ln -s /xxx/xxx/libpcre.so.1 /lib64
ln -s /xxx/xxx/libpcre.so.1 /lib
```
### 编写uwsgi的配置文件:
	
```
[uwsgi]
socket=127.0.0.1:5000  # 这里填写的端口要和nginx里面的一致，这里的socket也是nginx和uwsgi通信的重要凭据


chdir=/var/www/alpr-website			# 项目路径
pythonpath=/home/wan/anaconda3/bin  # 指定网站运行所依赖的anaconda环境

module=app      
wsgi-file=alpr-website/app.py    # 要运行的python文件
callable=app                     # app = Flask(__name__)这个app
#logto=/var/log/uwsgi/infor.log  # uwsgi写日志的路径 
```
启动:
```
~/anaconda3/bin/uwsgi --ini alpr-website_uwsgi.ini
```
	


### 收尾(让应用服务器在后台启动)

使用uwsgi emperor来使服务器在后台运行

创建配置文件
```
vim /etc/init/uwsgi.conf
```	
文件内容如下:
```
description "uWSGI"
start on runlevel [2345]
stop on runlevel [06]
respawn

env UWSGI=/home/wan/anaconda3/bin/uwsgi
env LOGTO=/var/log/uwsgi/emperor.log

exec $UWSGI --master --emperor /etc/uwsgi/vassals --die-on-term --uid www-data --gid www-data --logto $LOGTO
```	

## other 

### centos:

查看开放了哪些端口(防火墙会关闭端口):
```
firewall-cmd --list-all
```
添加开放端口:
```
firewall-cmd --add-port=8080/tcp --permanent
```
重新加载
```
firewall-cmd --reload
```
	
### ubuntu:

查看防火墙状态:
```
sudo ufw status
```


	
	
	
	
	