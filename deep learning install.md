## 安装Anaconda
## 安装显卡驱动
* 使用驱动精灵安装显卡驱动
* 自己去英伟达官网下载显卡驱动
		下载地址如下：[https://www.nvidia.cn/Download/index.aspx?lang=cn](https://www.nvidia.cn/Download/index.aspx?lang=cn)
## 安装cuda
去官网下载cuda库，地址如下：
[https://developer.nvidia.com/cuda-downloads](https://developer.nvidia.com/cuda-downloads)
首页可以选择操作系统以及显卡等信息，下载后就可以安装了！

### linux安装cuda的步骤

1. 安装显卡驱动

卸载原有的驱动

```
sudo apt-get remove --purge nvidia*
```

禁用nouveau

```
sudo gedit /etc/modprobe.d/blacklist.conf
```
在文本最后添加以下内容

```
blacklist nouveau
option nouveau modeset=0
```

保存退出，执行以下的命令使其生效
```
sudo update-initramfs -u
```
重启电脑后输入：
```
lsmod | grep nouveau
```
没有任何输出则说明禁用成功

安装显卡驱动

先去官网下载自己显卡对应的显卡驱动

停掉linux图形界面的服务
```
sudo service lightdm stop
```
按住ctrl+alt+f1切换到纯控制台界面

切换到下载了驱动的目录(我这里是deep learning dependence)
```
cd deep learning dependence
```
给驱动赋可执行权限
```
sudo chmod a+x NVIDIA-Linux-xxx.run
```
安装
```
sudo ./NVIDIA-Linux-xxx.run -no-opengl-files
```
(提示安装基本上都是accept, yes, 当提示你nvidia-xconfig时，如果有双显卡就选择不安装，如果单显卡就选择安装)

安装完成后可执行`nvidia-smi`命令检验是否安装成功,如果输出了显卡的使用信息则说明安装成功

此时可以启用图形界面的服务了
```
sudo service lightdm start
```
然后按ctrl+alt+f7切换回图形界面

2.安装cuda

去nvidia官网下载cuda后，进入下载的目录，然后给文件赋予可执行权限
```
sudo chmod a+x cuda_xxxx.run
```
安装
```
sudo ./cuda_xxx.run --no-opengl-libs
```
安装步骤
```
Do you accept the previously read EULA?
accept/decline/quit: accept
 
Install NVIDIA Accelerated Graphics Driver for Linux-x86_64 361.62?
(y)es/(n)o/(q)uit: n
 
Install the CUDA 8.0 Toolkit?
(y)es/(n)o/(q)uit: y
 
Enter Toolkit Location
[ default is /usr/local/cuda-8.0 ]:(直接回车)
 
Do you want to install a symbolic link at /usr/local/cuda?
(y)es/(n)o/(q)uit: y
 
Install the CUDA 8.0 Samples?
(y)es/(n)o/(q)uit: y
 
Enter CUDA Samples Location
[ default is /home/tang]:(直接回车)
```
安装完成后配置环境变量
```
export PATH=/usr/local/cuda-10.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
```
使配置生效
```
source ~/.bashrc
```


## 配置cudnn库

### windows版本的配置

下载cudnn库的地址如下：
[https://developer.nvidia.com/rdp/form/cudnn-download-survey](https://developer.nvidia.com/rdp/form/cudnn-download-survey)
 1. 根据安装的cuda版本，然后下载对应的cudnn库（注意：cudnn的下载需要注册）
 2. 将cudnn里面的bin、include、lib/x64下面的文件分别复制	到C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0目录下面对应的文件夹下面(cuda的安装使用的是默认安装路径)
 
 
### Linux系统的配置

将cudnn复制到对应的文件夹内

下载好cuda对应的cudnn版本后解压该文件
```
tar -xvf cudnn-10.0-xxx.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
```
## 安装tensorflow

先在Anaconda里面创建一个专门用于tensorflow的虚拟环境：

打开Anaconda Prompt，输入一下命令：

```
conda create -n tensorflow python=3.6
```
激活刚刚创建的虚拟环境

```
activate tensorflow       
```
使用pip安装tensorflow，使用清华镜像源

（当使用的是cuda10.0和cudnn7.6.1.34时，应该安装tensorflow-gpu=1.13.1版本）

```
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple tensorflow-gpu==1.13.1
```
 安装opencv
 

```
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple opencv-python
```
 查看pip安装后的文件位置
 

```
pip show -f tensorflow-gpu
```
 
 pip延长超时时间
 
```
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --default-timeout=100
```

 安装keras
 

```
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple keras
```
## 安装pytorch
创建pytorch虚拟环境

```
conda create -n pytorch python=3.6
```
先更换源（如果没有更换源，那么安装也超慢，不推荐）

```
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
```
 设置搜索时显示通道地址
```
conda config --set show_channel_urls yes
```
使用conda安装（要指定安装环境，否则会安装到root里面，下面的-n参数就是指定安装的虚拟环境）

```
conda install -n pytorch pytorch torchvision cudatoolkit=10.0 #如果使用-c pytorch则就不能使用添加的清华镜像安装了，-c参数后面是指定channel的意思
```
或者使用pip安装（这个速度超慢，不推荐）

```
activate pytorch
pip install https://download.pytorch.org/whl/cu90/torch-1.1.0-cp36-cp36m-win_amd64.whl
pip install https://download.pytorch.org/whl/cu90/torchvision-0.3.0-cp36-cp36m-win_amd64.whl
```
## 安装mxnet
创建虚拟环境

```
conda create -n mxnet python=3.6
activate mxnet
```
安装mxnet(使用镜像来安装mxnet)

```
pip install mxnet-cu100 -i https://pypi.douban.com/simple 
```
## other:
给指定环境安装依赖

```
conda install -n tensorflow_v2 numpy
```
删除指定虚拟环境

```
conda remove -n tensorflow --all
```

conda设置默认安装镜像
在anaconda控制台下面运行如下的命令：

```
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --set show_channel_urls yes
```

或者修改用户目录下面的 .condarc文件：
```
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
```

pip设置默认清华镜像(linux操作系统下面)

```
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```
	

镜像安装python包
```
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple scikit-image
```

anaconda常用命令

```
conda update -n base conda        //update最新版本的conda
conda create -n xxxx python=3.5   //创建python3.5的xxxx虚拟环境
conda activate xxxx               //开启xxxx环境
conda deactivate                  //关闭环境
conda env list                    //显示所有的虚拟环境
```

离线创建虚拟环境

```
conda create -n yourenvname --clone root
```

离线安装包

```
conda install packagename --offline
```