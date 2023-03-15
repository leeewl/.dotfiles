#!/usr/bin/bash

sudo pacman -Syyu networkmanager network-manager-applet networkmanager-openconnect

sudo pacman -Syyu wqy-microhei
sudo pacman -Syyu fcitx fcitx-configtool fcitx-googlepinyin #fcitx-im
sudo pacman -Syyu alsa-utils
#sudo pacman -Syyu termite
# 安装终端
sudo pacman -Syyu terminator
# 解压.gz文件
sudo pacman -Syyu gzip

# 使用ifconfig
sudo pacman -Syyu net-tools

rm -r ~/.config/i3
ln -s $HOME/.dotfiles/.config/i3 ~/.config/i3
rm -r ~/.config/polybar
ln -s $HOME/.dotfiles/.config/polybar ~/.config/polybar
rm -r ~/.config/rofi
ln -s $HOME/.dotfiles/.config/rofi ~/.config/rofi
#安装termite之后生成的配置文件在/etc/xdg/termite/config,目的配置文件在~/.config/termite/config
rm -r ~/.config/termite
ln -s $HOME/.dotfiles/.config/termite ~/.config/termite

rm ~/.bash_profile
ln -s $HOME/.dotfiles/home/.bash_profile ~/.bash_profile

rm ~/.bashrc
ln -s $HOME/.dotfiles/home/.bashrc ~/.bashrc

rm ~/.zshrc
ln -s $HOME/.dotfiles/home/.zshrc ~/.zshrc

rm ~/.p10k.zsh
ln -s $HOME/.dotfiles/home/.p10k.zsh ~/.p10k.zsh

rm ~/.gitconfig
ln -s $HOME/.dotfiles/home/.gitconfig ~/.gitconfig

rm ~/.xinitrc
ln -s $HOME/.dotfiles/home/.xinitrc ~/.xinitrc

# xwindow按键的配置, 左control和Caps_Lock都是ctrl
rm ~/.Xmodmap
ln -s $HOME/.dotfiles/home/.Xmodmap ~/.Xmodmap

# 修改按键 左ctrl和Caps键互换
# 相比us.map文件,personal.map文件,设置 keycode 29 = Caps_Lock, keycode 58 = Control
# 虚拟终端按键的配置，这个暂时不配置了
#sudo ln -s $HOME/.dotfiles/docs/gz/personal.map.gz /usr/share/kbd/keymaps/i386/qwerty/personal.map.gz
#sudo sh -c "echo 'KEYMAP=personal' >> /etc/vconsole.conf"

# 安装yay
#cd /tmp
#git clone https://aur.archlinux.org/yay.git
#cd yay
#makepkg -si
#cd









