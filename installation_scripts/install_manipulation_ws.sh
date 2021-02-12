#!/bin/bash
# This file should be sourced


##### CREATE SUTURO WSs ######

mkdir -p SUTURO_WSS/manipulation_ws/src

echo -e "\033[1;31m###################### manipulation_ws ###############################"
cd manipulation_ws/src
wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_manipulation/master/workspace.rosinstall -y
wstool update

cd ../..

