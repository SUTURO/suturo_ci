#! /bin/bash

# call this script from outside this repository

source /opt/ros/melodic/setup.bash

source suturo_ci/installation_scripts/install_dependencies_ws.sh
cd SUTURO_WSS/dependencies_ws
catkin build
source devel/setup.bash
cd ../..

source suturo_ci/installation_scripts/install_knowledge_ws.sh
cd SUTURO_WSS/knowledge_ws
catkin build
source devel/setup.bash
cd ../..

source suturo_ci/installation_scripts/install_manipulation_ws.sh
cd SUTURO_WSS/manipulation_ws
catkin build
source devel/setup.bash
cd ../..

source suturo_ci/installation_scripts/install_navigation_ws.sh
cd SUTURO_WSS/navigation_ws
catkin build
source devel/setup.bash
cd ../..

source suturo_ci/installation_scripts/install_perception_ws.sh
cd SUTURO_WSS/perception_ws
catkin build
source devel/setup.bash
cd ../..

source suturo_ci/installation_scripts/install_planning_ws.sh
cd SUTURO_WSS/planning_ws
catkin build
source devel/setup.bash
cd ../..

