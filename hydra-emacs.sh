#!/bin/bash
git clone git://git.savannah.gnu.org/emacs.git -b feature/native-comp
cd emacs
./autogen.sh
./configure --with-nativecomp
make -j$(nproc)
# run sudo make install

