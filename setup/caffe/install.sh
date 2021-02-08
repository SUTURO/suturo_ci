#!/bin/bash
# This file should be sourced

mkdir caffe
cd caffe

echo "Downloading caffe"
wget -q -O caffe.zip https://github.com/BVLC/caffe/archive/master.zip

echo "Unpacking Caffe"
unzip -qq caffe.zip
rm caffe.zip

cd caffe
echo "Downloading custom Makefile.config"
wget -q -O Makefile.config


mkdir build
cd build

echo "running cmake"
cmake .. >> ../../cmake_output
echo "running make all"
make -j($ nproc) all >> ../../make_output
echo "running make install"
make install >> ../../make_install_output

cd ../../..

