#!/bin/bash
if [ `whoami` != 'root' ]
then
    sudo apt -y install libgmp-dev dmenu libxrandr-dev libxinerama-dev libasound2-dev libxml2-dev libxpm-dev
    curl -sSL https://get.haskellstack.org/ | sh
    stack install xmonad xmonad-extras
    stack install xmobar
#     stack install --flag xmobar:all_extensions xmobar
#     stack install \
# --flag xmobar:with_xft \
# --flag xmobar:with_iwlib \
# --flag xmobar:with_alsa \
# --flag xmobar:with_weather \
# 	  xmobar
    git clone https://github.com/digital-asset/ghcide.git
    cd ghcide
    stack install
    cd ..
    rm -rf ghcide/
else
    echo "can't be root"
fi
# start new project:
#     stack new my-project
#     cd my-project
#     stack setup
#     stack build
#     stack exec my-project-exe


