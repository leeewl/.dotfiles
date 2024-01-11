# .dotfiles
archlinux i3wm dotfiles

# 常用软件说明

## 截图软件
### flameshot
在终端中输入
```
flameshot gui
```

## 声音调节
在终端输入
```
alsamixer
```

## 联wifi
进入iwctl
```
iwctl
```
进入后
```
device list

# 这里假定扫描到的设备为wlan0
station wlan0 scan
station wlan0 get-networks
station wlan0 connect 网络名
quit
```
