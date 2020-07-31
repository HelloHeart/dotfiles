#!/bin/bash
# sudo apt install ghc
if [ `whoami` != 'root' ]
then
    curl -sSL https://get.haskellstack.org/ | sh
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


