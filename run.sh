conda install -y scikit-learn scikit-image nose

git clone https://github.com/ermaker/autofpop.git -b new_recognizer
cd autofpop
nosetests -s --nologcapture tests/test_recognizer_dl.py
