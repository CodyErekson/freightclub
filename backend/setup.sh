#!/bin/sh
set -e

# This script is called by entrypoint.sh and runs as root.

if [ ! -f "artisan" ]; then
    echo "Laravel not found. Installing..."
    
    # Clear any existing files that might interfere with a clean install
    # The '|| true' ensures the script doesn't fail if the files don't exist
    rm -rf vendor composer.lock composer.json || true
    
    # Install Laravel
    composer create-project --prefer-dist laravel/laravel . "11.*" --no-interaction --no-dev

    if [ $? -eq 0 ]; then
        echo "Laravel installed successfully!"
        
        # Configure .env file
        cp .env.example .env
        php artisan key:generate
        sed -i 's/DB_CONNECTION=mysql/DB_CONNECTION=sqlite/' .env
        # Ensure the database path is correct for the container
        sed -i 's#DB_DATABASE=.*#DB_DATABASE=/var/www/html/database/game.db#' .env
        touch database/game.db
        
        # Run initial migrations
        php artisan migrate --force
    else
        echo "Failed to install Laravel!"
        exit 1
    fi
else
    echo "Laravel already installed. Skipping installation."
    # Ensure database is up-to-date
    php artisan migrate --force
fi

# Install MQTT client
echo "Installing/updating MQTT client..."
composer require php-mqtt/client --no-interaction

echo "Application setup completed." 