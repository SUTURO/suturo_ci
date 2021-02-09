#!/bin/bash
# This file should be sourced

mkdir opencv
cd opencv

echo "Downloading OpenCV and OpenCVContrib"
wget -q -O opencv4_5_1.tar.gz https://github.com/opencv/opencv/archive/4.5.1.tar.gz
wget -q -O opencv_contrib_4_5_1.tar.gz https://github.com/opencv/opencv_contrib/archive/4.5.1.tar.gz

echo "Unpacking OpenCV"
tar xfz opencv4_5_1.tar.gz
tar xfz opencv_contrib_4_5_1.tar.gz
rm opencv4_5_1.tar.gz opencv_contrib_4_5_1.tar.gz

cd opencv4_5_1

mkdir build
cd build

echo "running cmake"
cmake -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib_4_5_1/modules .. >> ../../cmake_output
echo "running make all"
make -j$(nproc) >> ../../make_output

cd ../../..

