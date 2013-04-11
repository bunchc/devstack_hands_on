#!/bin/bash

# common.sh
#
# Authors: Kevin Jackson (kevin@linuxservices.co.uk)
#          Cody Bunch (bunchc@gmail.com)
#
# Sets up common bits used in each build script.
#

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get install python-software-properties git curl wget -y
#sudo add-apt-repository ppa:ubuntu-cloud-archive/grizzly-staging
#sudo apt-get update && apt-get upgrade -y
