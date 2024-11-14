#! /bin/bash
yum -y install gcc openssl-devel bzip2-devel wget
cd /tmp/
wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
tar -xzf Python-3.6.9.tgz
cd Python-3.6.9
./configure --enable-optimizations
make altinstall
mv /usr/local/bin/python3.6 /usr/bin/python3.6

python --version