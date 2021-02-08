# suturo_ci

This repository contains the scripts used by the SUTURO bachelor and master projects for Continuous Integration purposes. But this repository also contains scripts that can be used to setup a full development PC.


# Setting up a SUTURO development pc

### Clone this repository
We recommend to do this in a ~/SUTURO directory.

## install general dependencies
This script will install ROS, Gazebo and the HSR development tools.

source suturo_ci/scripts/install_suturo_deps.sh

## Install OpenCV
Because OpenCV takes a long time to install the script is seperated out.

source suturo_ci/scripts/install_opencv_only.sh

after the script finished you can delete the OCV folder.

## Setup the SUTURO Workspaces

source suturo_ci/scripts/install_suturo_workspaces.sh

This script will take a long time (20min+), because the Percpetion_WS is build with only on core activated to precent weird crashes.
