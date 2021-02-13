#!/bin/sh -l

mkdir -p resources_ws/src
mv resources resources_ws/src/

source /opt/ros/melodic/setup.bash

cd resources_ws && catkin build 2> error && test -s error && echo "Test if error exits successfull" && exit 1 && echo "after exit 1"

echo "Building SUTURO Resources Successfull"
