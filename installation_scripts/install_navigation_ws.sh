#!/bin/bash
# This file should be sourced


##### CREATE SUTURO WSs ######

mkdir -p SUTURO_WSS/navigation_ws/src

echo -e "\033[1;31m###################### navigation_ws ###############################"
cd navigation_ws/src
wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_navigation/master/workspace.rosinstall -y
wstool update

cd ../..

