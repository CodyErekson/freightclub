# Use the official PHP image with FPM
FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    sqlite3

# Install PHP extensions required by Laravel
RUN docker-php-ext-install pdo_sqlite pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy setup script and database files
COPY setup.sh /usr/local/bin/setup.sh
COPY database/ /var/www/html/database/
RUN chmod +x /usr/local/bin/setup.sh
RUN chmod +x /var/www/html/database/init_database.sh
RUN chmod +x /var/www/html/database/create_game_session.sh

# Set permissions for storage and bootstrap cache
RUN mkdir -p storage bootstrap/cache && \
    chown -R www-data:www-data storage bootstrap/cache && \
    chmod -R 775 storage bootstrap/cache

# Expose port 9000 and start setup script
EXPOSE 9000
CMD ["/usr/local/bin/setup.sh"] 