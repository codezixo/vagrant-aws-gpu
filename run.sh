sudo apt-get install -y git
conda install -y pandas scikit-learn scikit-image nose h5py

git clone https://github.com/ermaker/autofpop.git -b apply_logic
cd autofpop
python -m autofpop.make_model
ls -l model
