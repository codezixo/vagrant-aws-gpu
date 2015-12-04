# -*- mode: ruby -*-
# vi: set ft=ruby :

require "dotenv"
Dotenv.load

Vagrant.configure("2") do |config|
  config.vm.provision :shell, inline: <<-EOC
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb
dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb
rm -f cuda-repo-ubuntu1404_7.5-18_amd64.deb

apt-get update
apt-get install -y cuda
apt-get install -y --no-install-recommends \
  build-essential \
  curl \
  git \

curl -qsSLkO \
  https://repo.continuum.io/miniconda/Miniconda-latest-Linux-`uname -p`.sh
bash Miniconda-latest-Linux-`uname -p`.sh -b
rm Miniconda-latest-Linux-`uname -p`.sh

export PATH=/root/miniconda2/bin:$PATH
conda install -y \
  h5py \
  pandas \
  theano
pip install --upgrade --no-deps git+git://github.com/Theano/Theano.git
pip install keras

conda install -y \
  scikit-learn \
  scikit-image \
  nose

  EOC

  config.vm.provider :aws do |aws,override|
    override.vm.box = "dummy"
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    aws.access_key_id = ENV["AWS_ACCESS_KEY_ID"]
    aws.secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]

    aws.keypair_name = "default"
    override.ssh.private_key_path = "keys/default.pem"

    aws.ami = "ami-20b6aa21"
    override.ssh.username = "ubuntu"

    aws.region = "ap-northeast-1"
    aws.instance_type = "g2.2xlarge"
    aws.security_groups = "default_instance"
    aws.tags = {Name: "GPU"}
    override.vm.hostname = ENV['AWS_HOSTNAME']
  end
end
