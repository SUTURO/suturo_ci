#!/bin/sh -l

mkdir -p resources_ws/src
mv resources resources_ws/src/

cd resources_ws && catkin build

echo "Building SUTURO Resources Successfull"
