#!/bin/bash
# This file should be sourced


##### CREATE SUTURO WSs ######

mkdir -p SUTURO_WSS/planning_ws/src



echo -e "###################### planning_ws ###############################"
cd SUTURO_WSS/planning_ws/src
wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_planning/master/planning_ws.rosinstall -y
wstool update

cd ..

