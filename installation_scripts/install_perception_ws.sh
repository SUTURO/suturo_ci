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

cd ../..

