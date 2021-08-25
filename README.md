# suturo_ci

This repository contains the scripts used by the SUTURO bachelor and master projects for Continuous Integration purposes. But this repository also contains scripts that can be used to setup a full development PC.


# Setting up a SUTURO development pc
## install dependencies
    sudo apt install wget
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
    
    # We want couchdb configured without a preset
    sudo echo "couchdb couchdb/mode select none" | sudo debconf-set-selections
    
    sudo apt update
    sudo apt-get install -y cmake g++ unzip libboost-all-dev libopenblas-dev libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler the python-dev libgflags-dev libgoogle-glog-dev liblmdb-dev python-pip python3-pip ros-melodic-desktop-full python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-rosdep ros-melodic-tmc-desktop-full ros-melodic-roslisp-repl rapidjson-dev automake libxerces-c-dev libicu-dev libapr1-dev mongodb openjdk-8-jdk libatlas-base-dev liblapack-dev libblas-dev ros-melodic-costmap-2d ros-melodic-cl-tf2  libjson-glib-dev

    sudo -H pip install future protobuf tinyrpc==0.9.4 pyzmq pybullet==3.0.6 scipy==1.2.2 casadi sortedcontainers hypothesis==4.34.0 pandas==0.24.2 numpy==1.16
    sudo -H pip3 install simplenlg http://www.jbox.dk/sling/sling-2.0.0-py3-none-linux_x86_64.whl tinyrpc==0.9.4 pyzmq
    
## Install MongoDB Version 4+ (If you want to run Knowledge)
To see your currently installed version:

    mongo --eval 'db.runCommand({ connectionStatus: 1 })'

If you see exception connection failed your mongodb server service is not running (run: sudo systemctl start mongod.service).
If the command does not exist, follows these steps as well.

Stop mongod service if it is runnning.

     sudo systemctl stop mongod.service

purge(/ hard uninstall) mongodb installs 

    sudo apt-get purge mongo*
    
add apt keys

    curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
    sudo apt-get update     # You should see OK:9 https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 Release
    
Install and test
    
    sudo apt install mongodb-org
    # Test start mongo server service
    sudo systemctl start mongod.service
    sudo systemctl status mongod
    # You should see: active (running) highlighted in green
    # if so check your MongoDB Version again:
    mongo --eval 'db.runCommand({ connectionStatus: 1 })'
    # Should be 4.4.5 or higher
    # if so:
    sudo systemctl enable mongod
    
If sudo systemctl status mongod says failed:
Multiple things might be the cause
    
+No /data/db folder

    mkdir -p /data/db
    
+Broken config file

    # Try running:
    /usr/bin/mongod --config /etc/mongod.conf
    # If it fails:
    /usr/bin/mongod
    # If running  without a config works, create a backup of the original config and create a new empty one
    sudo mv /etc/mongod.conf /etc/mongod.conf.backup
    sudo touch /etc/mongod.conf

+Wrong permissions

    ls -l /var/lib/mongodb
    
    # These files should be owned by mongodb not root
    # to change that run:
    
    chown -R mongodb:mongodb /var/lib/mongodb
    
+ try repairing the db
    
    sudo rm /var/lib/mongodb/mongod.lock
    mongod --repair
    


## clone this repo
Create a SUTURO folder in your home. In this folder you should clone this repository.

    cd ~
    mkdir SUTURO
    cd SUTURO
    git clone https://github.com/SUTURO/suturo_ci.git


Your filestructure should now look like this:
```
~  
│
└───SUTURO
│   │
│   └───suturo_ci
│       │   
│       └───setup
│       └───installation_scripts
│       └───...
│   
...
```


## install opencv (If you don't have it already)
Staying in ~/SUTURO

    source suturo_ci/setup/opencv/install.sh
    
    
Your filestructure should now look like this:
   
```
~  
│
└───SUTURO
│   │
│   └───suturo_ci
│   │   │   
│   │   └───setup
│   │   └───installation_scripts
│   │   └───...
│   │
│   └───opencv
│       │   
│       └───opencv-4.5.1
│       └───opencv_contrib-4.5.1
│   
...
```


## install caffe (If you don't have it already)
Staying in ~/SUTURO

    source suturo_ci/setup/caffe/install.sh
    
Your filestructure should now look like this:
    
```
~  
│
└───SUTURO
│   │
│   └───suturo_ci
│   │   │   
│   │   └───setup
│   │   └───installation_scripts
│   │   └───...
│   │
│   └───opencv
│   │   │   
│   │   └───opencv-4.5.1
│   │   └───opencv_contrib-4.5.1
│   │
│   └───caffe
│       │   
│       └───caffe-master
│   
...
```
    
Still in $HOME (~)
Download bvlc_reference_caffenet.model used by perception and save it in $HOME. 

    python caffe/caffe-master/scripts/download_model_binary.py caffe/caffe-master/models/bvlc_reference_caffenet/
    cp caffe/caffe-master/models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel ~
    
    
Your filestructure should now look like this:
    
```
~  
|
│   bvlc_reference_caffenet.caffemodel
|
└───SUTURO
│   │
│   └───suturo_ci
│   │   │   
│   │   └───setup
│   │   └───installation_scripts
│   │   └───...
│   │
│   └───opencv
│   │   │   
│   │   └───opencv-4.5.1
│   │   └───opencv_contrib-4.5.1
│   │
│   └───caffe
│       │   
│       └───caffe-master
│   
...
```
    

    
## Install all the Workspaces
This will create a SUTURO_WSS folder with a the dependencies inside it.
This will also move the caffe model to the correct location.

**THIS WILL TAKE ATLEAST 30-60min**

**Robosherlock is build using one Thread to fix crashes**
This script does not stop when ```catkin build``` fails it will continue with the other workspaces.

    source suturo_ci/installation_scripts/build.sh


```
~  
|
│   bvlc_reference_caffenet.caffemodel
|
└───SUTURO
│   │
│   └───suturo_ci
│   │   |
│   │   ...
│   │ 
│   └───opencv
│   │   |
│   │   ...
│   │
│   └───caffe
│   │   |
│   │   ...
│   │
│   └───SUTURO_WSS
│       |
│       └───dependencies_ws
│       └───knowledge_ws
│       └───manipulation_ws
│       └───navigation_ws
│       └───perception_ws
│       └───planning_ws
│   
...
```

After these steps every Workspace has its packages downloaded and build once.


## Debugging your installation

### General
When the installation of ros-melodic-tmc-desktop-full fails:

    sudo apt update && sudo apt install -y curl apt-transport-https gnupg
    curl https://couchdb.apache.org/repo/keys.asc | gpg --dearmor | sudo tee /usr/share/keyrings/couchdb-archive-keyring.gpg >/dev/null 2>&1
    source /etc/os-release
    echo "deb [signed-by=/usr/share/keyrings/couchdb-archive-keyring.gpg] https://apache.jfrog.io/artifactory/couchdb-deb/ ${VERSION_CODENAME} main" | sudo tee /etc/apt/sources.list.d/couchdb.list >/dev/null

    sudo apt update
    sudo apt install -y couchdb
    

### Knowledge
When catkin build fails with prolog _pkg_check_modules_internal
in SUTURO_WSS/knowledge_ws/src try:
    
    rosdep install --from-paths knowrob/ --ignore-src
    
When knowledge starts with the error:
    
    '$open_shared_object'/3: libjvm.so: cannot open shared object file: No such file or directory

Try:

    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/java-11-openjdk-amd64/lib/server

