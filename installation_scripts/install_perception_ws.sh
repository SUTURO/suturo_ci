#!/bin/bash
# This file should be sourced


##### CREATE SUTURO WSs ######

mkdir -p SUTURO_WSS/perception_ws/src

echo -e "###################### perception_ws ###############################"

cd SUTURO_WSS/perception_ws/src

wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_perception/master/workspace.rosinstall -y

git clone https://github.com/RoboSherlock/robosherlock.git --recursive
git clone https://github.com/Paniago82/rs_resources.git
git clone https://github.com/Jastock/rs_addons.git
git clone https://github.com/SUTURO/suturo_perception.git

rosdep install --from-path robosherlock --ignore-src -r
rosdep install --from-path rs_resources --ignore-src -r

rm rs_addons/descriptors/annotators/KnnAnnotator.yaml
wget -q -O rs_addons/descriptors/annotators/KnnAnnotator.yaml https://raw.githubusercontent.com/SUTURO/suturo_ci/master/installation_scripts/KnnAnnotator.yaml

mv ~/bvlc_reference_caffenet.caffemodel rs_resources/caffe/models/bvlc_reference_caffenet/

cd ..

