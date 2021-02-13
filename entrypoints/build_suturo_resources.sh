#!/bin/sh -l

mkdir -p resources_ws/src
mv resources resources_ws/src/

source /opt/ros/melodic/setup.bash

cd resources_ws/src

wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_resources/ci_test/rosinstall.rosinstall -y
wstool update

cd ..
catkin build --no-status
