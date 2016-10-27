# 安裝環境參考資料
# https://www.tensorflow.org/versions/r0.11/get_started/os_setup.html

# install pip (python2)
apt-get install -y python-pip python-dev

# Ubuntu/Linux 64-bit, CPU only, Python 2.7
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.11.0rc1-cp27-none-linux_x86_64.whl

# Install tensorflow
pip install --upgrade $TF_BINARY_URL

# upgrade pip to latest version
pip install --upgrade pip