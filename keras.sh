#!/bin/bash

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y git
pip install --no-deps git+git://github.com/fchollet/keras.git
