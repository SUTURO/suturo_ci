#!/bin/bash
# This file should be sourced


##### CREATE SUTURO WSs ######

mkdir -p SUTURO_WSS/knowledge_ws/src SUTURO_WSS/dependencies_ws/src SUTURO_WSS/manipulation_ws/src SUTURO_WSS/perception_ws/src SUTURO_WSS/navigation_ws/src SUTURO_WSS/planning_ws/src

echo -e "\033[1;31m########################## dependencies ws ######################################"

source /opt/ros/melodic/setup.bash

cd SUTURO_WSS/dependencies_ws/src

wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_planning/grocery-fix/planning_dependency.rosinstall -y
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_perception/master/dependencies.rosinstall -y
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_knowledge/master/dependencies.rosinstall -y
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_navigation/master/dependencies.rosinstall -y
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_manipulation/master/dependencies.rosinstall -y
wstool update

rosdep install --from-path . --ignore-src -r

cd ../..

echo -e "\033[1;31m###################### perception_ws ###############################"

cd perception_ws/src

wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_perception/master/workspace.rosinstall -y
wstool update

rosdep install --from-path robosherlock --ignore-src -r
rosdep install --from-path rs_resources --ignore-src -r

cd ../..

echo -e "\033[1;31m###################### planning_ws ###############################"
cd planning_ws/src
wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_planning/grocery-fix/planning_ws.rosinstall -y
wstool update

cd ../..

echo -e "\033[1;31m###################### navigation_ws ###############################"
cd navigation_ws/src
wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_navigation/master/workspace.rosinstall -y
wstool update

cd ../..

echo -e "\033[1;31m###################### manipulation_ws ###############################"
cd manipulation_ws/src
wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_manipulation/master/workspace.rosinstall -y
wstool update

cd ../..

echo -e "\033[1;31m###################### knowledge_ws ###############################"
cd knowledge_ws/src
wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_knowledge/master/workspace.rosinstall -y
wstool update

cd ../..

