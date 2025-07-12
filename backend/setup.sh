#!/bin/bash

# Get current user ID and group ID from environment variables
USER_ID=${UID:-1000}
GROUP_ID=${GID:-1000}

# Create Composer config directory if it doesn't exist
mkdir -p /var/www/.composer
chown -R $USER_ID:$GROUP_ID /var/www/.composer

# Check if Laravel is already installed
if [ ! -f "artisan" ]; then
    echo "Laravel not found. Installing..."
    composer create-project --prefer-dist laravel/laravel . "11.*" --no-interaction
    
    # Fix ownership immediately after installation
    chown -R $USER_ID:$GROUP_ID .
    chmod -R 775 storage bootstrap/cache
    echo "Laravel installed successfully!"
else
    echo "Laravel already installed. Skipping installation."
fi

# Install additional dependencies for MQTT
composer require php-mqtt/client

# Ensure all files are owned by the current user (final safety check)
chown -R $USER_ID:$GROUP_ID .

# Start PHP-FPM
php-fpm 