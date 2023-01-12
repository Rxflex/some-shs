#!/bin/bash
cd /mnt/server

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Print Node.js Version
node -v

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP_CMD} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/mnt/server$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
