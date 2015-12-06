#!/bin/bash

sudo apt-get install -y git
conda install -y h5py pandas theano
pip install --upgrade --no-deps git+git://github.com/Theano/Theano.git

cat >~/.theanorc <<-EOF
[global]
device = gpu
floatX = float32
warn_float_64 = warn
cast_policy = numpy+floatX

[cuda]
root=/usr/local/cuda
EOF
