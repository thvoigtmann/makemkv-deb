#!/bin/bash
echo "Installing apt packages"
mkv_version="1.18.1"
test -n "$1" && mkv_version="$1"
echo "trying version $mkv_version"
sudo apt-get install build-essential pkg-config libc6-dev libssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev git ffmpeg wget 
mkdir -p makemkv
cd makemkv
echo "Downloading Makemkv"
test -r "makemkv-bin-$mkv_version.tar.gz" || wget "https://www.makemkv.com/download/makemkv-bin-$mkv_version.tar.gz"
test -r "makemkv-oss-$mkv_version.tar.gz" || wget "https://www.makemkv.com/download/makemkv-oss-$mkv_version.tar.gz"
test -d "makemkv-bin-$mkv_version" && rm -r "makemkv-bin-$mkv_version"
test -d "makemkv-oss-$mkv_version" && rm -r "makemkv-oss-$mkv_version"
tar xvf "makemkv-bin-$mkv_version.tar.gz"
tar xvf "makemkv-oss-$mkv_version.tar.gz"
echo "Installing makemkv-oss"
cd "makemkv-oss-$mkv_version"
#sed -i "s/av_mallocz_array/av_calloc/g" libffabi/src/ffabi.c
./configure --disable-gui --disable-qt5
make
echo "MakeMKV blu ray tool (oss part)" > description-pak
sudo checkinstall --install=no -D --pakdir=../ --nodoc
cd ..
cd "makemkv-bin-$mkv_version"
echo "Installing makemkv-bin"
make
echo "MakeMKV blu ray tool (bin part)" > description-pak
sudo checkinstall --install=no -D --pakdir=../ --nodoc
echo "Cleaing up"
cd ../..
rm -rf "makemkv/makemkv-oss-$mkv_version"
rm -rf "makemkv/makemkv-bin-$mkv_version"

#if which makemkv >/dev/null 2>&1; then
#    echo "Installed successfully"
#else
#    echo "Installation Faild"
#fi
echo "Done"
