#!/bin/bash

GH_URI="https://${GH_TOKEN}@github.com/ermaker/autofpop.git"
DATE=`date +%Y%m%d%H%M%S`
TARGET_BRANCH=model_${DATE}

sudo apt-get install -y git
conda install -y pandas scikit-learn scikit-image nose h5py

rm -rf autofpop
git clone $GH_URI -b $BASE_BRANCH
cd autofpop
git checkout -b $TARGET_BRANCH

python -m autofpop.make_model |& tee model/log

git add -A model
git config --global user.name "`git --no-pager show --no-patch --format=%an`"
git config --global user.email "`git --no-pager show --no-patch --format=%ae`"
git commit -m "Update model at ${DATE}"
git push $GH_URI $TARGET_BRANCH --quiet
