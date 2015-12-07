#!/bin/bash

pip install /vagrant/tensorflow/tensorflow-0.5.0-py2-none-any.whl

# Set the backend of keras to tensorflow
mkdir ~/.keras
echo '{"epsilon": 1e-07, "floatx": "float32", "backend": "tensorflow"}' > ~/.keras/keras.json
