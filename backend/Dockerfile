# Use the official PHP image with FPM
FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gosu \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    sqlite3 \
    libsqlite3-dev \
    zip \
    unzip \
    libzip-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions required by Laravel
RUN docker-php-ext-install pdo_mysql pdo_sqlite mbstring exif pcntl bcmath gd zip

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy application scripts
COPY setup.sh /usr/local/bin/setup.sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/setup.sh /usr/local/bin/entrypoint.sh

# The entrypoint script will handle user switching and permissions.
# We don't need to create the user here anymore.

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# The command that the entrypoint will execute after setting up.
CMD ["php-fpm"] 