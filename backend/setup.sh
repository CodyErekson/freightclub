#!/bin/sh
set -e

# This script is called by entrypoint.sh and runs as root.

if [ ! -f "artisan" ]; then
    echo "Laravel not found. Installing into a temporary directory..."

    # Install Laravel into a temp directory because the target volume is not empty.
    composer create-project --prefer-dist laravel/laravel /tmp/laravel-install "11.*" --no-interaction --no-dev

    if [ $? -eq 0 ]; then
        echo "Installation successful. Moving files to final destination..."
        # Copy all contents (including hidden files) from the temp directory to the web root.
        cp -a /tmp/laravel-install/. /var/www/html/
        # Clean up the temporary directory
        rm -rf /tmp/laravel-install
        echo "Laravel files moved successfully."

        # Configure .env file
        if [ ! -f ".env" ]; then
            cp .env.example .env
        fi
        php artisan key:generate
        sed -i 's/DB_CONNECTION=mysql/DB_CONNECTION=sqlite/' .env
        sed -i 's#DB_DATABASE=.*#DB_DATABASE=/var/www/html/database/game.db#' .env
        touch database/game.db

        # Run initial migrations
        echo "Running database migrations..."
        php artisan migrate --force

        # Seed the database
        echo "Seeding the database..."
        php artisan db:seed --force

    else
        echo "ERROR: Failed to install Laravel into temporary directory!"
        exit 1
    fi
else
    echo "Laravel already installed. Ensuring database is up to date..."
    php artisan migrate --force
fi

# Install/update MQTT client
echo "Installing/updating MQTT client..."
composer require php-mqtt/client --no-interaction

echo "Application setup completed." 