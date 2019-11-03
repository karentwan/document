1.安装Anaconda

2.安装cuda(安装前需要安装驱动精灵来安装显卡驱动)
3.将cudnn里面的bin、include、lib/x64下面的文件分别复制
	到C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0目录下面对应的文件夹下面
4.安装tensorflow
	先在Anaconda里面创建一个专门用于tensorflow的虚拟环境：
	打开Anaconda Prompt，输入一下命令：
	conda create -n tensorflow python=3.6
	# 激活刚刚创建的虚拟环境
	activate tensorflow       
	# 使用pip安装tensorflow，使用清华镜像源
	（当使用的是cuda10.0和cudnn7.6.1.34时，应该安装tensorflow-gpu=1.13.1版本）
	pip install -i https://pypi.tuna.tsinghua.edu.cn/simple tensorflow-gpu==1.13.1
	# 安装opencv
	pip install -i https://pypi.tuna.tsinghua.edu.cn/simple opencv-python
	# 查看pip安装后的文件位置
	pip show -f tensorflow-gpu
	# 安装keras
	pip install -i https://pypi.tuna.tsinghua.edu.cn/simple keras

5.安装pytorch
	创建pytorch虚拟环境
	conda create -n pytorch python=3.6
	先更换源（如果没有更换源，那么安装也超慢，不推荐）
	conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
	# 设置搜索时显示通道地址
	conda config --set show_channel_urls yes
	使用conda安装（要指定安装环境，否则会安装到root里面，下面的-n参数就是指定安装的虚拟环境）：
	conda install -n pytorch pytorch torchvision cudatoolkit=9.0
	或者使用pip安装（这个速度超慢，不推荐）
	activate pytorch
	pip install https://download.pytorch.org/whl/cu90/torch-1.1.0-cp36-cp36m-win_amd64.whl
	pip install https://download.pytorch.org/whl/cu90/torchvision-0.3.0-cp36-cp36m-win_amd64.whl
	# 使用conda安装
	conda install -n pytorch pytorch torchvision cudatoolkit=10.0 #如果使用-c pytorch则就不能使用添加的清华镜像安装了，-c参数后面是指定channel的意思
	
	
6.安装mxnet
	创建虚拟环境
	conda create -n mxnet python=3.6
	activate mxnet
	安装mxnet(使用镜像来安装mxnet)
	pip install mxnet-cu100 -i https://pypi.douban.com/simple 
	
7.安装keras
	ps:因为keras只是一个高层封装api，所以在装keras之前，一定要装一个深度学习框架作为后端，例如tensorflow
	activate tensorflow
	pip install keras
	
other:
	# 给指定环境安装依赖
	conda install -n tensorflow_v2 numpy
	
	# 删除指定虚拟环境
	conda remove -n tensorflow --all
	
anaconda常用命令：
	conda update -n base conda        //update最新版本的conda
	conda create -n xxxx python=3.5   //创建python3.5的xxxx虚拟环境
	conda activate xxxx               //开启xxxx环境
	conda deactivate                  //关闭环境
	conda env list                    //显示所有的虚拟环境