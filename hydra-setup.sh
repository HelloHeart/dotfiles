#!/bin/bash
# run as sudo
# if you need to run a command as "$user", run as sudo -u "$user" command
# make sure to clone the repository with yadm first: yadm clone https://github.com/HelloHeart/dotfiles
apt update
yes | apt upgrade
yes | apt install virt-manager gnome-boxes mpv redshift-gtk keepassxc yadm emacs youtube-dl python4-pip python3-setuptools python3-dev neovim openjdk-11-jdk woof gdb silversearcher-ag make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl libvirt-daemon-system qemu-kvm libvirt-clients qemu-utils spice-client-gtk gir1.2-spiceclientgtk-3.0 atril ffmpeg atomicparsley anki workrave clang clang-tools cheese trayer mit-scheme simplescreenrecorder
yes | apt remove qpdfview
yes | apt autoremove
sed -i 's/XKBOPTIONS="grp:alt_shift_toggle,terminate:ctrl_alt_bksp,grp_led:scroll"/XKBOPTIONS="terminate:ctrl_alt_bksp,grp_led:scroll""/g' /etc/default/keyboard
sed -i 's/Option "DontZap" "Off"/Option "DontZap" "yes"/g' /etc/X11/xorg.conf.in
yes | sudo apt install macchanger
