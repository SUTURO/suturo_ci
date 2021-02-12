#!/bin/bash
# This file should be sourced


##### CREATE SUTURO WSs ######

mkdir -p SUTURO_WSS/knowledge_ws/src

echo -e "\033[1;31m###################### knowledge_ws ###############################"
cd knowledge_ws/src
wstool init
wstool merge https://raw.githubusercontent.com/SUTURO/suturo_knowledge/master/workspace.rosinstall -y
wstool update

cd ../..

