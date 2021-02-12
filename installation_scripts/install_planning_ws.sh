#!/bin/bash
# This file should be sourced


##### CREATE SUTURO WSs ######

mkdir -p SUTURO_WSS/planning_ws/src



echo -e "\033[1;31m###################### planning_ws ###############################"
cd planning_ws/src
wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_planning/grocery-fix/planning_ws.rosinstall -y
wstool update

cd ../..

