#!/bin/bash
# This file should be sourced


##### CREATE SUTURO WSs ######

mkdir -p SUTURO_WSS/perception_ws/src

echo -e "\033[1;31m###################### perception_ws ###############################"

cd perception_ws/src

wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_perception/master/workspace.rosinstall -y
wstool update

rosdep install --from-path robosherlock --ignore-src -r
rosdep install --from-path rs_resources --ignore-src -r

rm rs_addons/descriptors/annotators/KnnAnnotator.yaml
wget -q -O rs_addons/descriptors/annotators/KnnAnnotator.yaml https://raw.githubusercontent.com/SUTURO/suturo_ci/master/installation_scripts/KnnAnnotator.yaml

mv ~/bvlc_reference_caffenet.caffemodel rs_resources/caffe/models/bvlc_reference_caffenet/

cd ../..

