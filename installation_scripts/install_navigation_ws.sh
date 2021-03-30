#!/bin/bash
# This file should be sourced


##### CREATE SUTURO WSs ######

mkdir -p SUTURO_WSS/navigation_ws/src

echo -e "###################### navigation_ws ###############################"
cd SUTURO_WSS/navigation_ws/src
wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_navigation/master/workspace.rosinstall -y
wstool update

cd ..

