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
    sqlite3 \
    libsqlite3-dev \
    zip \
    unzip

# Install PHP extensions required by Laravel
RUN docker-php-ext-install pdo_mysql pdo_sqlite mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy setup script
COPY setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

# Create a user with the same UID/GID as the host user
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID appuser && useradd -u $UID -g $GID -m appuser

# Set permissions for storage and bootstrap cache
RUN mkdir -p storage bootstrap/cache && \
    chown -R appuser:appuser storage bootstrap/cache && \
    chmod -R 775 storage bootstrap/cache

# Switch to the appuser
USER appuser

# Expose port 9000 and start setup script
EXPOSE 9000
CMD ["/usr/local/bin/setup.sh"] 