#!/bin/bash

# Create Composer config directory if it doesn't exist
mkdir -p /var/www/.composer
chown -R www-data:www-data /var/www/.composer

# Check if Laravel is already installed
if [ ! -f "artisan" ]; then
    echo "Laravel not found. Installing..."
    composer create-project --prefer-dist laravel/laravel . "11.*" --no-interaction
    chown -R www-data:www-data .
    chmod -R 775 storage bootstrap/cache
    echo "Laravel installed successfully!"
else
    echo "Laravel already installed. Skipping installation."
fi

# Install additional dependencies for MQTT
composer require php-mqtt/client

# Initialize the database
echo "Initializing database..."
/var/www/html/database/init_database.sh

# Start PHP-FPM
php-fpm 