# suturo_ci

This repository contains the scripts used by the SUTURO bachelor and master projects for Continuous Integration purposes. But this repository also contains scripts that can be used to setup a full development PC.


# Setting up a SUTURO development pc
## install dependencies
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

    sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
    wget http://packages.ros.org/ros.key -O - | sudo apt-key add -

    sudo sh -c 'echo "deb https://packages.hsr.io/ros/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/tmc.list'
    sudo sh -c 'echo "deb https://packages.hsr.io/tmc/ubuntu `lsb_release -cs` multiverse main" >> /etc/apt/sources.list.d/tmc.list'
    sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
    sudo sh -c 'echo "deb https://apache.bintray.com/couchdb-deb `lsb_release -cs` main" > /etc/apt/sources.list.d/couchdb.list'
    wget https://hsr-user:jD3k4G2e@packages.hsr.io/tmc.key -O - | sudo apt-key add -
    wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
    wget https://couchdb.apache.org/repo/bintray-pubkey.asc -O - | sudo apt-key add -
    sudo sh -c 'mkdir -p /etc/apt/auth.conf.d'
    sudo sh -c '/bin/echo -e "machine packages.hsr.io\nlogin hsr-user\npassword jD3k4G2e" >/etc/apt/auth.conf.d/auth.conf'

    sudo add-apt-repository ppa:robosherlock/ppa

    sudo apt-get install -y cmake g++ wget unzip libboost-all-dev libopenblas-dev libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler the python-dev libgflags-dev libgoogle-glog-dev liblmdb-dev python-pip python3-pip ros-melodic-desktop-full python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-rosdep ros-melodic-tmc-desktop-full ros-melodic-roslisp-repl rapidjson automake libxerces-c-dev libicu-dev libapr1-dev mongodb openjdk-8-jdk ros-kinetic-libmongocxx-ros

    sudo -H pip install protobuf tinyrpc==0.9.4 zmq pybullet scipy==1.2.2 casadi sortedcontainers hypothesis==4.34.0 pandas==0.24.2 numpy==1.16
    sudo -H pip3 install simplenlg sling tinyrpc==0.9.4 zmq

## clone this repo
We generally recommend creating a SUTURO folder in your $HOME. In this folder you should clone this repository.

## install opencv and caffe
Staying in SUTURO

    source setup/opencv/install.sh
    sudo make install opencv/opencv4_5_1

    source setup/caffe/install.sh
    sudo make install caffe/caffe
