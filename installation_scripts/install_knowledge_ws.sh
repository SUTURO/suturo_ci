#!/bin/bash
# This file should be sourced


##### CREATE SUTURO WSs ######

mkdir -p SUTURO_WSS/knowledge_ws/src

echo -e "###################### knowledge_ws ###############################"
cd SUTURO_WSS/knowledge_ws/src
wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_knowledge/master/workspace.rosinstall -y
wstool update

cd ..

