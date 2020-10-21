cd ~/Downloads
curl -O http://prdownloads.sourceforge.net/sbcl/sbcl-2.0.7-x86-64-linux-binary.tar.bz2
bzip2 -cd sbcl-2.0.7-x86-64-linux-binary.tar.bz2 | tar xvf -
cd sbcl-2.0.7-x86-64-linux
sudo ./install.sh
sudo apt -y install hyperspec
cd ..
rm -rf sbcl-2.0.7-x86-64-linux sbcl-2.0.7-x86-64-linux-binary.tar.bz2
# do this after:
# cd ~/
# curl -O https://beta.quicklisp.org/quicklisp.lisp
# sbcl --load quicklisp.lisp
# (quicklisp-quickstart:install :path ".quicklisp/")
# (ql:quickload "quicklisp-slime-helper")
# rm quicklisp.lisp


