#!/bin/sh -l
wget -q https://raw.githubusercontent.com/Schnippa/suturo_ci/master/installation_scripts/install_dependencies_ws.sh

source install_dependencies_ws.sh

cd dependencies_ws && catkin build

echo "Did Build Dependencies WS"
