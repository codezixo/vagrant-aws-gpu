#!/bin/bash

echo grub grub/update_grub_changeprompt_threeway select install_new | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y linux-headers linux-image-extra-virtual
