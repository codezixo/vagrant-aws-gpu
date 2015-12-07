#!/bin/bash

# Install bazel
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq oracle-java8-installer pkg-config zip g++ zlib1g-dev unzip
curl -qsSLkO https://github.com/bazelbuild/bazel/releases/download/0.1.1/bazel-0.1.1-installer-linux-x86_64.sh
sudo bash bazel-0.1.1-installer-linux-x86_64.sh
rm -f bazel-0.1.1-installer-linux-x86_64.sh

# Install tensorflow
git clone --recurse-submodules https://github.com/tensorflow/tensorflow
TF_UNOFFICIAL_SETTING=1 TF_NEED_CUDA=1 ./configure </dev/null
bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
pip install /tmp/tensorflow_pkg/tensorflow-0.5.0-cp27-none-linux_x86_64.whl
rm -rf /tmp/tensorflow_pkg

# Set the backend of keras to tensorflow
mkdir ~/.keras
echo '{"epsilon": 1e-07, "floatx": "float32", "backend": "tensorflow"}' > ~/.keras/keras.json
