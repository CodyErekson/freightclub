#!/bin/bash

# Fix permissions for Docker-created files
echo "Fixing file ownership..."

# Get current user
CURRENT_USER=$(whoami)
CURRENT_UID=$(id -u)
CURRENT_GID=$(id -g)

echo "Current user: $CURRENT_USER (UID: $CURRENT_UID, GID: $CURRENT_GID)"

# Fix ownership of all files in the project
sudo chown -R $CURRENT_USER:$CURRENT_USER .

# Fix specific directories that might have been created by Docker
sudo chown -R $CURRENT_USER:$CURRENT_USER backend/
sudo chown -R $CURRENT_USER:$CURRENT_USER frontend/
sudo chown -R $CURRENT_USER:$CURRENT_USER mosquitto/

echo "Ownership fixed!" 