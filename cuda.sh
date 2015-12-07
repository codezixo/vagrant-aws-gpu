#!/bin/bash
export DEBIAN_FRONTEND=nointeractive

curl -qsSLkO http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb
rm -f cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo apt-get update
sudo apt-get install -y cuda-7-0

tar xzf /vagrant/cudnn/cudnn-6.5-linux-x64-v2.tgz
sudo cp cudnn-6.5-linux-x64-v2/libcudnn* /usr/local/cuda/lib64
sudo cp cudnn-6.5-linux-x64-v2/cudnn.h /usr/local/cuda/include/
rm -rf cudnn-6.5-linux-x64-v2

echo export CUDA_HOME=/usr/local/cuda >> ~/.profile
echo export PATH=\$CUDA_HOME/bin:\$PATH >> ~/.profile
echo export LD_LIBRARY_PATH=\$CUDA_HOME/lib64 >> ~/.profile
source ~/.profile
