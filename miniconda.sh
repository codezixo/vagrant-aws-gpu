#!/bin/bash

# sudo apt-get install -y --no-install-recommends build-essential
curl -qsSLkO https://repo.continuum.io/miniconda/Miniconda-latest-Linux-`uname -p`.sh
bash Miniconda-latest-Linux-`uname -p`.sh -b
rm Miniconda-latest-Linux-`uname -p`.sh

echo export PATH=\$HOME/miniconda2/bin:\$PATH >> ~/.profile
source ~/.profile

conda install -y pip
