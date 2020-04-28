#!/bin/bash
# run as sudo
# if you need to run a command as "$user", run as sudo -u "$user" command 
# remember to install ghidra
user="amol"
apt update
yes | apt upgrade
yes | apt install virt-manager gnome-boxes mpv redshift keepassxc yadm emacs youtube-dl python3-pip python3-setuptools python3-dev neovim
sudo -u "$user" pip3 install wheel pwntools neovim
cd /home/"$user"/Downloads
sudo -u "$user" git clone https://github.com/guyinatuxedo/nightmare.git
cd /home/"$user"
sudo -u "$user" yadm clone https://github.com/HelloHeart/dotfiles
sudo -u "$user" yadm checkout laptop
