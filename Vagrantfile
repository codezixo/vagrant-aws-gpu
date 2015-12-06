# -*- mode: ruby -*-
# vi: set ft=ruby :

require "dotenv"
Dotenv.load

ENV['VAGRANT_DEFAULT_PROVIDER'] ||= 'aws'

Vagrant.configure("2") do |config|
  config.vm.provision :shell, privileged: false, inline: <<-EOC
source /vagrant/cuda.sh
source /vagrant/kernel.sh
source /vagrant/miniconda.sh
# source /vagrant/tensorflow.sh
source /vagrant/tensorflow_cpu.sh
source /vagrant/keras.sh
sudo reboot
  EOC

  config.vm.provider :aws do |aws, override|
    override.vm.box = "dummy"
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    aws.access_key_id = ENV["AWS_ACCESS_KEY_ID"]
    aws.secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]

    aws.keypair_name = "default"
    override.ssh.private_key_path = "keys/default.pem"

    aws.ami = "ami-936d9d93"
    override.ssh.username = "ubuntu"

    aws.region = "ap-northeast-1"
    aws.instance_type = "g2.2xlarge"
    aws.security_groups = "default_instance"
    aws.tags = {Name: "GPU"}
    override.vm.hostname = ENV['AWS_HOSTNAME']
  end
end
