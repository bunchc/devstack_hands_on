#!/bin/bash

# controller.sh

# Authors: Kevin Jackson (kevin@linuxservices.co.uk)
#          Cody Bunch (bunchc@gmail.com)

# Source in common env vars
. /vagrant/common.sh

# Install git
git clone git://github.com/openstack-dev/devstack.git

# Create stackrc & localrc
cat > /tmp/localrc <<EOF

disable_service n-net
enable_service q-svc
enable_service q-agt
enable_service q-dhcp
enable_service q-l3
enable_service q-meta
enable_service quantum
# Optional, to enable tempest configuration as part of devstack
enable_service tempest
enable_service g-api

SCHEDULER=nova.scheduler.simple.SimpleScheduler

ADMIN_PASSWORD=openstack
MYSQL_PASSWORD=openstack
RABBIT_PASSWORD=openstack
SERVICE_PASSWORD=openstack
SERVICE_TOKEN=openstack

#OFFLINE=True
#RECLONE=True
EOF

cp /tmp/localrc devstack/localrc

# Install DevStack
cd devstack; sudo ./stack.sh