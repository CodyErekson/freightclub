#!/bin/sh
set -e

# This script runs as root.

# Get the UID and GID from the environment, defaulting to 1000.
USER_ID=${UID:-1000}
GROUP_ID=${GID:-1000}

echo "Starting with UID: $USER_ID, GID: $GROUP_ID"

# Run the application setup script.
# This will install Laravel, dependencies, etc.
/usr/local/bin/setup.sh

# After setup, recursively change ownership of all files in the
# application directory to match the host user.
# This is the most critical step to fix host permission issues.
echo "Fixing directory permissions..."
chown -R $USER_ID:$GROUP_ID /var/www/html

echo "Handing over to user and starting application..."
# Finally, execute the main command (like php-fpm) as the specified user.
# The "$@" passes any command from the Dockerfile's CMD line.
exec gosu $USER_ID:$GROUP_ID "$@" 