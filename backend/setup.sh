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
    
    # Clear any existing files that might interfere
    rm -rf vendor composer.lock composer.json
    
    # Install Laravel with specific version
    composer create-project --prefer-dist laravel/laravel . "11.*" --no-interaction --no-dev
    
    if [ $? -eq 0 ]; then
        echo "Laravel installed successfully!"
        
        # Copy environment file
        if [ ! -f ".env" ]; then
            cp .env.example .env
            echo "Created .env file from .env.example"
        fi
        
        # Generate application key
        php artisan key:generate --no-interaction
        
        # Configure database
        sed -i 's/DB_CONNECTION=mysql/DB_CONNECTION=sqlite/' .env
        sed -i 's/DB_DATABASE=laravel/DB_DATABASE=\/var\/www\/html\/database\/game.db/' .env
        
        # Create necessary Laravel directories
mkdir -p database/migrations database/seeders storage/logs storage/framework/cache storage/framework/sessions storage/framework/views bootstrap/cache
        
        # Initialize database
        echo "Initializing database..."
        php artisan migrate --force
        
        # Seed database if seeder exists
        if [ -f "database/seeders/DatabaseSeeder.php" ]; then
            php artisan db:seed --force
        fi
        
    else
        echo "Failed to install Laravel!"
        exit 1
    fi
else
    echo "Laravel already installed. Checking configuration..."
    
    # Ensure .env exists
    if [ ! -f ".env" ]; then
        cp .env.example .env
        echo "Created .env file from .env.example"
        php artisan key:generate --no-interaction
    fi
    
    # Run migrations to ensure database is up to date
    php artisan migrate --force
fi

# Install additional dependencies for MQTT
echo "Installing MQTT client..."
composer require php-mqtt/client --no-interaction

# Ensure all files are owned by the current user (final safety check)
chown -R $USER_ID:$GROUP_ID .

# Set proper permissions
chmod -R 775 storage bootstrap/cache
chmod -R 775 database

echo "Setup completed successfully!"

# Start PHP-FPM
php-fpm 