
安装JDK

sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\*
sudo add-apt-repository ppa:webupd8team/java && sudo apt-get update && sudo apt-get install oracle-java7-installer


配置java

update-alternatives --config javac

测试JDK

java -version  

成功安装JDK
java version "1.6.0_45"
Java(TM) SE Runtime Environment (build 1.6.0_45-b06)
Java HotSpot(TM) 64-Bit Server VM (build 20.45-b01, mixed mode)

安装编译的库文件

sudo apt-get install libstdc++6 && sudo apt-get install m4 && sudo apt-get install schedtool && sudo apt-get install libc6-i386 && sudo apt-get install libstdc++6 && sudo apt-get install lib32stdc++6 && sudo apt-get install maven && sudo apt-get install xmllint && sudo apt-get install libxml2-utils

/bin/bash: xmllint: 未找到命令

解决
sudo apt-get install xsltproc && sudo apt-get install libxml2-utils

/bin/bash: mvn: 未找到命令

解决
sudo apt-get install maven


先执行
sudo apt-get update && sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-multilib

====================================================================================================
sudo apt-get install git gnupg ccache lzop flex bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 libc6-dev lib32bz2-1.0 lib32ncurses5-dev x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 lib32z1-dev libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc libreadline6-dev lib32readline-gplv2-dev libncurses5-dev bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev lib32bz2-dev squashfs-tools pngcrush c dpkg-dev

接着再执行这个命令
sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so

下载repo (这步要翻墙，提示：改hosts  修改命令：(先赋权限)sudo chmod a+x /etc/hosts 接着输：(编辑hosts)sudo gedit /etc/hosts)  也可以挂VPN

https://serve.netsh.org/pub/ipv4-hosts/

mkdir ~/bin && curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo

New Repo Update:

https://storage.googleapis.com/git-repo-downloads/repo


把repo环境加入变量 

sudo gedit ~/.bashrc

在最后一句添加

export PATH=~/bin:$PATH

更新.bashrc

source ~/.bashrc

==================================================================================================

这样环境就搭建好了

接下来同步源码

MIUI拉包：../tools/releasetools/ota_target_from_phone -r |n

插桩使用的命令行：

 make workspace (创建工作目录)

     make firstpatch (自动插桩) (this will add the miui code into framework/android.policy/services.jar, resolve any conflict)

     make fullota (打包)

==================================================================================================
 
设置git账户

git config --global user.email "843243689@qq.com" && git config --global user.name "xintiaoxuanlv0225"

ubuntu 全局透明

安装工具 sudo apt install unity-tweak-tool

=================================================================================================

开启ccache

设置方法：
在你home主目录的.bashrc中加入：

sudo gedit ~/.bashrc

export USE_CCACHE=1

如果你需要指定一个特殊的缓存目录，也需要在.bashrc中加入，不指定则为你当前用户目录下的.ccache。

export CCACHE_DIR=/home/android/.ccache

source ~/.bashrc

在MoKee OpenSource主目录中运行，50G~100G之间手动指定：

prebuilts/misc/linux-x86/ccache/ccache -M 50G


更新源码报错：

repo sync --force sync


ubuntu不能访问win磁盘解决方法

解决办法：
1、打开终端：如果没有安装ntfs-3g就要安装：sudo apt-get install ntfs-3g
2、修复挂载错误的相应的分区如提示中的/dev/sda8，

例如：sudo ntfsfix /dev/sda8  （根据磁盘提示输入）

测试依赖库不足：

sudo apt-get install -f  


由于没有公钥，无法验证下列签名:

gpg --keyserver subkeys.pgp.net --recv 8D5A09DC9B929006 (错误ID)

安装ADB驱动

sudo apt-get install android-tools-adb

linux superr kitchen 更新地址：

git clone https://bitbucket.org/superr/superrs-kitchen.git
cd superrs-kitchen
./superr

JDK手动搭建环境：

需要下载一个linux x64 版本的JDK，下载地址：http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html 

在主文件夹目录Ctrl+H 显示隐藏文件

找到.bashrc文件使用gedit编辑器打开，拉到最后添加如下代码：

JAVA_HOME=/home/chen/jdk1.8.0_102

export JRE_HOME=/home/chen/jdk1.8.0_102/jre

export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH

export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH

chen是我的电脑用户名改为自己的用户名

修改完成后，在终端输入 source .bashrc 然后回车

再接着输入which java 后 回车显示JDK路径

继续输入javac 显示java信息就说名安装成功了


修改ubuntu启动项：

sudo gedit /etc/default/grub

sudo update-grub


linux 配置ADB devices 方法：

1、将手机连接电脑，然后在终端输入 lsusb 回车，显示设备信息

2、继续在终端输入 sudo gedit /etc/udev/rules.d/51-android.rules
	SUBSYSTEM=="usb",
	ATTR{idVendor}=="2717",
	MODE="0666", GROUP="plugdev"
	
	内容参考：https://developer.android.com/studio/run/device.html#developer-device-options

3、赋予权限：sudo chmod a+r /etc/udev/rules.d/51-android.rules

adb 常用命令：

adb kill-server (关掉adb端口被占用)

adb start-server (重新开启adb服务)

adb devices (检测设备连接)

adb shell (获取root权限)


桌面底部布局：

gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

gsettings set com.canonical.Unity.Launcher launcher-position Bottom


安装numix图标：

sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme-circle

sudo apt install 'numix-**'


关闭触摸板：

关闭触摸板： sudo modprobe -r psmouse
 
打开触摸板： sudo modprobe psmo

1.在当前用户的根目录创建bin文件夹，并添加到系统环境变量中。

    $ mkdir ~/bin
    $ PATH=~/bin:$PATH


2.下载Repo并给予执行权限

    $ curl https://download.mokeedev.com/git-repo-downloads/repo > ~/bin/repo
    $ chmod a+x ~/bin/repo

安装32位依赖库，解决Ubuntu新版无法安装第三方软件 :

sudo apt-get install lib32ncurses5 && sudo apt-get install lib32z1

解决输入法无法切换问题：

fcitx autostart

E: 无法获得锁 /var/lib/dpkg/lock - open (11: 资源暂时不可用)

解决办法如下：

1.终端输入 ps  -aux ，列出进程,找到含有apt-get的进程，直接sudo kill PID解决。

2.强制解锁--命令:

sudo rm /var/cache/apt/archives/lock

sudo rm /var/lib/dpkg/lock

Ubuntu 安装apktool
https://ibotpeaches.github.io/Apktool/install/

按照步骤一步一步来就是了:

１．右击链接保存为　apktool

２．下载最新的apktool-2

３．确定是否有 32 bit libraries

4．下载的文件改名为apktool.jar

5．移动两个文件到　/usr/local/bin 　

这里，我是把两个文件放在 donwload 目录里，进入目录　 :  sudo mv -i apktool apktool.jar /usr/local/bin/　，输入密码后就移动好了

6．给apktool 文件执行的权限：

进入目录　cd  /usr/local/bin/ 

sudo chmod +x apktool

ubuntu主题资源下载

http://ppa.launchpad.net/noobslab/icons/ubuntu/pool/main/u/ultra-flat-icons/

删除已添加源
sudo add-apt-repository -r ppa:tualatrix/ppa(添加的名称)

sudo apt-get update

http://www.noobslab.com 主题资源

清华大学开源软件镜像站

https://mirrors.tuna.tsinghua.edu.cn/


双系统win10+Ubuntu时间不准确的解决方法

打开终端 安装ntpdate

sudo apt-get install ntpdate

然后更新win的时间

sudo ntpdate time.windows.com

然后将时间更新到硬件上：

sudo hwclock --localtime --sysohc

手机端 LoneyFool Tools ext4 安装后解决权限问题

终端运行： busybox mount -o remount,rw,suid,dev,atime /data

Windows 双系统 Ubuntu 不能进入 Ubuntu 解决方法

利用Ubuntu镜像安装模式，然后点击Try Ubuntu

在终端执行一下命令

sudo add-apt-repository ppa:yannubuntu/boot-repair

sudo apt-get install boot-repair

打开 boot repair 工具

选择 Recommended repair

等待修复完成重启即可 

Ubuntu安装谷歌浏览器

点击左上角的 Dash 的搜索框中输入 terminal 或“终端”，点击启动终端，或直接组合键按下 Ctrl + Alt + t ，启动终端；
在Ubuntu 中安装谷歌浏览器

2、添加下载源到系统的源列表。在终端输入以下命令：

sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/

3、导入谷歌的公钥用于接下来对软件进行验证。在终端输入以下命令：

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -

正常显示OK 

4、对系统的可用更新列表进行更新，获取最新的软件版本信息。在终端中输入以下命令：

sudo apt-get update

更新完后命令将返回图中所示信息；

5、谷歌浏览器的安装。在终端中输入以下命令：

sudo apt-get install google-chrome-stable

6、启动浏览器。此时再次点击左上角的dash，输入google将会看到刚刚安装 好的谷歌浏览器，点击即可启动。

或者在终端中执行以下命令：

/usr/bin/google-chrome-stable

将会直接启动谷歌浏览器。

Kali Linux Go环境变量搭建

Go 安装包下载
https://studygolang.com/dl

官方安装教程

http://docs.studygolang.com/doc/install

把已经下载的Go语言安装包进行解压到 /usr/local

tar -xzf go1.8.3.linux-amd64.tar.gz -C /usr/local

命令添加环境
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile

手动添加环境

gedit /etc/profile

拉到最后一行添加以下代码：

export GOROOT=/usr/local/go

export GOPATH=~/golib:~/goproject

export GOBIN=~/gobin

export PATH=$PATH:$GOROOT/bin:$GOBIN

然后更新 /etc/profile 文件

source /etc/profile 

测试环境

go version

安装输入法

apt-get install fcitx fcitx-googlepinyin

然后注销或者重启生效








