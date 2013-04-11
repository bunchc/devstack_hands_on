#!/bin/bash

# compute.sh

# Authors: Cody Bunch (bunchc@gmail.com)

# Source in common env vars
. /vagrant/common.sh

# Install git
git clone git://github.com/openstack-dev/devstack.git

# Create localrc
cat > /tmp/localrc <<EOF

ENABLED_SERVICES=n-cpu,rabbit,g-api,quantum,q-agt
SERVICE_HOST=172.16.211.143
MYSQL_HOST=$SERVICE_HOST
RABBIT_HOST=$SERVICE_HOST
Q_HOST=$SERVICE_HOST

EOF

cp /tmp/localrc devstack/localrc

# Install DevStack
cd devstack; sudo ./stack.sh