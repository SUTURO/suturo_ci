
#!/bin/bash
# This file should be sourced


##### CREATE SUTURO WSs ######

mkdir -p SUTURO_WSS/dependencies_ws/src

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

