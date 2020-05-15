#!/bin/bash
# run as sudo
# if you need to run a command as "$user", run as sudo -u "$user" command
# remember to install ghidra
user="amol"
if [ -z "$part" ]
then
    apt update
    yes | apt upgrade
    yes | apt install virt-manager gnome-boxes mpv redshift-gtk keepassxc yadm emacs youtube-dl python3-pip python3-setuptools python3-dev neovim openjdk-11-jdk woof gdb silversearcher-ag make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl libvert-daemon-system qemu-kvm libvirt-clients qemu-utils spice-client-gtk gir1.2-spiceclientgtk-3.0 atril
    yes | apt remove qpdfview
    yes | apt autoremove
    sudo -u "$user" git clone https://github.com/pyenv/pyenv.git /home/"$user"/.pyenv
    python_version="$(python -V | cut -d ' ' -f 2)"
    sudo -u "$user" pyenv install "$python_version"
    sudo -u "$user" pyenv global "$python_version"
    part="1"
    source "./hydra-setup.sh"
else
    sudo -u "$user" git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    sudo -u "$user" pip3 install wheel pwntools neovim keystone-engine ropper jedi rope flake8 autopep8 yapf black
    #cd /home/"$user"/Downloads
    #sudo -u "$user" git clone https://github.com/guyinatuxedo/nightmare.git
    #cd /home/"$user"
    sudo -u "$user" yadm clone https://github.com/HelloHeart/dotfiles
    sudo -u "$user" yadm checkout laptop
    sed -i 's/XKBOPTIONS="grp:alt_shift_toggle,terminate:ctrl_alt_bksp,grp_led:scroll"/XKBOPTIONS="terminate:ctrl_alt_bksp,grp_led:scroll""/g' /etc/default/keyboard
    sed -i 's/Option "DontZap" "Off"/Option "DontZap" "yes"/g' /etc/X11/xorg.conf.in
    yes | sudo apt install macchanger
fi
