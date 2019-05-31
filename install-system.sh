#!/usr/bin/bash

# 执行wifi-menu 联网
echo "input wifi-menu to connect to the internet\n"

# 将国内仓库镜像地址提前
sed -i  "1 i\Server = http://mirror.veriteknik.net.tr/archlinux/\$repo/os/\$arch" /etc/pacman.d/mirrorlist

###############     磁盘分区
#fdisk

echo "initial a disk……"
echo -e "\033[31mWarning!:\033[0m"     #提醒用户危险操作
 
fdisk -l 2> /dev/null | grep -o "disk /dev/[sh]d[a-z]" #显示所有分区
 
read -p "your choice:" partdisk　　　　#读入要操作的分区
 
if [ $partdisk == "quit" ];then
     echo "quit"
    exit 7　　　　　　　　　　　　　　　　　　#错误退出，非0
fi

until fdisk -l 2> /dev/null | grep -o "disk /dev/[sh]d[a-z]" | grep "disk $partdisk$" &> /dev/null;do
    read -p "wrong option,your choice:"partdisk
done

read -p"are you sure?" choice

until [ $choice=='y' -o $choice =='n'];do
	read choice
done

if [$choice = n ];then
   exit 0
else
	
	dd if=/dev/zero of=$partdisk bs=512 count =1          #从设备/dev/zero输出0覆盖所在磁盘的第一个扇区，删除所有分区
sync
##删除所有分区
echo "partion"　　　　　　　　###
sleep 3　　　　　　　　　　　　#
echo 'n                    #32-45行echo的内容，和命令行中操作步骤一样
p                          #
1                          #
                           #
+20M                       #
n                          #
p                          #
3                          #

+128M
t
3
82
w'|fdisk $partition &>/dev/null      #返回消息送入/dev/null 设备
sync
partprobe $partdisk                  #写入硬盘
sync
sleep 3                             #同步内容花费时间较长，休眠3s否则下面格式化命令无法执行
mke2fs -j ${partdisk}1 &>/dev/null
mke2fs -j ${partdisk}2 &>/dev/null    #格式化分区，消息送入/dev/null
mkswap ${partdisk}3&>/dev/null        #格式化交换分区


## 挂载分区
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/EFI
mount /dev/sda1 /mnt/boot/EFI
mkdir /mnt/home
mount /dev/sda3 /mnt/home

# 安装基础包
pacstrap /mnt base

# 生成分区表
genfstab -U /mnt >> /mnt/etc/fstab

# 使用arch-chroot进入新系统
arch-chroot /mnt

# 时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 本地化设置
sed -i '/zh_CN.UTF-8/{s/#//}' /etc/locale.gen
locale-gen
echo 'LANG=zh_CN.UTF-8'  > /etc/locale.conf

# 主机名, 我的主机名是Garden
echo "Garden" > /etc/hostname

# hosts 我的hosts是Garden，根据自己的改
echo "127.0.0.1	localhost.localdomain	localhost" >> /etc/hosts
echo "::1		localhost.localdomain	localhost" >> /etc/hosts
echo "127.0.1.1	Garden.localdomain	Garden" >> /etc/hosts

# 安装必要软件
pacman -S networkmanager


#安装termite之后生成的配置文件在/etc/xdg/termite/config,目的配置文件在~/.config/termite/config








