cd ~/Downloads/
wget https://code.call-cc.org/releases/5.2.0/chicken-5.2.0.tar.gz
tar -xf chicken-5.2.0.tar.gz 
cd chicken-5.2.0/
make PLATFORM=linux
sudo make install PLATFORM=linux
cd ..
rm -rf chicken-5.2.0 chicken-5.2.0.tar.gz
cd ~
chicken-install -s apropos chicken-doc srfi-18 srfi-1 utf8
cd `csi -R chicken.platform -p '(chicken-home)'`
curl https://3e8.org/pub/chicken-doc/chicken-doc-repo-5.tgz | sudo tar zx
cd ~
