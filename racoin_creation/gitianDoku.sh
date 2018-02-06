Permit root users over SSH:

sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
/etc/init.d/ssh restart

After logging in as root over SSH:

apt-get install git ruby sudo apt-cacher-ng qemu-utils debootstrap lxc python-cheetah parted kpartx bridge-utils make ubuntu-archive-keyring curl
adduser debian sudo

echo "%sudo ALL=NOPASSWD: /usr/bin/lxc-start" > /etc/sudoers.d/gitian-lxc
echo "%sudo ALL=NOPASSWD: /usr/bin/lxc-execute" >> /etc/sudoers.d/gitian-lxc
echo '#!/bin/sh -e' > /etc/rc.local
echo 'brctl addbr br0' >> /etc/rc.local
echo 'ifconfig br0 10.0.3.2/24 up' >> /etc/rc.local
echo 'iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE' >> /etc/rc.local
echo 'echo 1 > /proc/sys/net/ipv4/ip_forward' >> /etc/rc.local
echo 'exit 0' >> /etc/rc.local
echo 'export USE_LXC=1' >> /home/debian/.profile
echo 'export GITIAN_HOST_IP=10.0.3.2' >> /home/debian/.profile
echo 'export LXC_GUEST_IP=10.0.3.5' >> /home/debian/.profile
reboot

After logging in as debian over SSH: 

wget http://archive.ubuntu.com/ubuntu/pool/universe/v/vm-builder/vm-builder_0.12.4+bzr494.orig.tar.gz
echo "76cbf8c52c391160b2641e7120dbade5afded713afaa6032f733a261f13e6a8e  vm-builder_0.12.4+bzr494.orig.tar.gz" | sha256sum -c
# (verification -- must return OK)
tar -zxvf vm-builder_0.12.4+bzr494.orig.tar.gz
cd vm-builder-0.12.4+bzr494
sudo python setup.py install
cd ..

clone gitian builder:

git clone https://github.com/devrandom/gitian-builder.git

Clone your coin into debian's home folder using git:

git clone https://github.com/schyczewski/funcoin.git 
(Obviously replace my info with yours)

Build base VM:
cd gitian-builder/
bin/make-base-vm --lxc --arch amd64 --suite precise

Dependencies (make sure this is done in the gitian-builder directory):

mkdir -p inputs; cd inputs/

wget 'http://miniupnp.free.fr/files/download.php?file=miniupnpc-1.9.20140401.tar.gz' -O 'miniupnpc-1.9.20140401.tar.gz'
wget 'https://www.openssl.org/source/openssl-1.0.1k.tar.gz'
wget 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
wget 'https://www.zlib.net/fossils/zlib-1.2.8.tar.gz'
wget 'ftp://ftp.simplesystems.org/pub/libpng/png/src/history/libpng16/libpng-1.6.8.tar.gz'
wget 'http://fukuchi.org/works/qrencode/qrencode-3.4.3.tar.bz2'
wget 'http://downloads.sourceforge.net/project/boost/boost/1.55.0/boost_1_55_0.tar.bz2'
wget 'https://download.qt.io/archive/qt/4.8/4.8.5/qt-everywhere-opensource-src-4.8.5.tar.gz'
wget 'https://svn.boost.org/trac/boost/raw-attachment/ticket/7262/boost-mingw.patch' -O boost-mingw-gas-cross-compile-2013-03-03.patch

Building depencies (in gitian-builder, replace instances of 'RACoin' with whatever you named your clone):

./bin/gbuild ../RACoin/contrib/gitian-descriptors/boost-win32.yml
mv build/out/boost-*.zip inputs/

./bin/gbuild ../RACoin/contrib/gitian-descriptors/deps-win32.yml
mv build/out/bitcoin*.zip inputs/

./bin/gbuild ../RACoin/contrib/gitian-descriptors/qt-win32.yml
mv build/out/qt*.zip inputs/

Compile your coin (remember tag & name change):

./bin/gbuild --commit RACoin=master ../RACoin/contrib/gitian-descriptors/gitian-win32.yml