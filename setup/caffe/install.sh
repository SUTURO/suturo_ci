#!/bin/bash
# This file should be sourced

mkdir caffe
cd caffe

echo "Downloading caffe"
wget -q -O caffe.zip https://github.com/BVLC/caffe/archive/master.zip

echo "Unpacking Caffe"
unzip -qq caffe.zip
rm caffe.zip

cd caffe-master
echo "Downloading custom Makefile.config"
wget -q -O Makefile.config https://raw.githubusercontent.com/SUTURO/suturo_ci/master/setup/caffe/Makefile.config


mkdir build
cd build

echo "running cmake"
cmake .. >> ../../cmake_output
echo "running make all"
make -j all >> ../../make_output

cd ../../..
