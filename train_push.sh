sudo apt-get install -y git
conda install -y pandas scikit-learn scikit-image nose h5py

GH_URI="https://${GH_TOKEN}@github.com/ermaker/autofpop.git"
BASE_BRANCH=apply_logic
DATE=`date +%Y%m%d%H%M%S`
TARGET_BRANCH=model_${DATE}
rm -rf autofpop
git clone $GH_URI -b $BASE_BRANCH
cd autofpop
git checkout -b $TARGET_BRANCH

python -m autofpop.make_model

git add -A model
git config --global user.name "`git --no-pager show --no-patch --format=%an`"
git config --global user.email "`git --no-pager show --no-patch --format=%ae`"
git commit -m "Update model at ${DATE}"
git push $GH_URI $TARGET_BRANCH --quiet