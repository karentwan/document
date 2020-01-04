## 安装Anaconda
## 安装显卡驱动
* 使用驱动精灵安装显卡驱动
* 自己去英伟达官网下载显卡驱动
		下载地址如下：[https://www.nvidia.cn/Download/index.aspx?lang=cn](https://www.nvidia.cn/Download/index.aspx?lang=cn)
## 安装cuda
去官网下载cuda库，地址如下：
[https://developer.nvidia.com/cuda-downloads](https://developer.nvidia.com/cuda-downloads)
首页可以选择操作系统以及显卡等信息，下载后就可以安装了！
## 配置cudnn库
下载cudnn库的地址如下：
[https://developer.nvidia.com/rdp/form/cudnn-download-survey](https://developer.nvidia.com/rdp/form/cudnn-download-survey)
 1. 根据安装的cuda版本，然后下载对应的cudnn库（注意：cudnn的下载需要注册）
 2. 将cudnn里面的bin、include、lib/x64下面的文件分别复制	到C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0目录下面对应的文件夹下面(cuda的安装使用的是默认安装路径)
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