#!/bin/bash

pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.5.0-cp27-none-linux_x86_64.whl

# Set the backend of keras to tensorflow
mkdir ~/.keras
echo '{"epsilon": 1e-07, "floatx": "float32", "backend": "tensorflow"}' > ~/.keras/keras.json
