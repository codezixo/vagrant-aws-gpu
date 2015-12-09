# -*- mode: ruby -*-
# vi: set ft=ruby :

require "dotenv"
Dotenv.load

ENV['VAGRANT_DEFAULT_PROVIDER'] ||= 'aws'

Vagrant.configure("2") do |config|
  config.vm.provider :aws do |aws, override|
    override.vm.box = "dummy"
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    aws.access_key_id = ENV["ACCESS_KEY_ID"]
    aws.secret_access_key = ENV["SECRET_ACCESS_KEY"]

    aws.keypair_name = ENV["KEYPAIR_NAME"]
    override.ssh.private_key_path = "keys/private.pem"

    aws.ami = "ami-936d9d93"
    override.ssh.username = "ubuntu"

    aws.region = "ap-northeast-1"
    aws.instance_type = "g2.2xlarge"
    aws.security_groups = ENV["SECURITY_GROUPS"]
    aws.tags = {Name: ENV["HOSTNAME"]}
    override.vm.hostname = ENV["HOSTNAME"]
  end

  config.vm.define :default, primary: true do |config|
    config.vm.provision :shell, privileged: false, inline: <<-EOC
source /vagrant/cuda.sh
source /vagrant/kernel.sh
source /vagrant/miniconda.sh
# source /vagrant/tensorflow_cpu.sh
source /vagrant/tensorflow_gpu.sh
source /vagrant/keras.sh
sudo reboot
    EOC
  end

  config.vm.define :tensorflow_compiler, autostart: false do |config|
    config.vm.provision :shell, privileged: false, inline: <<-EOC
source /vagrant/cuda.sh
source /vagrant/kernel.sh
source /vagrant/miniconda.sh
source /vagrant/tensorflow_compile.sh
    EOC
  end
end
