#!/bin/bash

# Database initialization script for Trade Wars game
# This script creates the main database and applies the schema

set -e

# Create database directory if it doesn't exist
mkdir -p /var/www/html/database

# Main database path
MAIN_DB="/var/www/html/database/main.db"

echo "Initializing main database..."

# Create the main database and apply schema
sqlite3 "$MAIN_DB" < /var/www/html/database/schema/main_schema.sql

# Seed the database with sample data
sqlite3 "$MAIN_DB" < /var/www/html/database/seed/sample_data.sql

echo "Main database created and seeded successfully at $MAIN_DB"

# Set proper permissions
chown -R www-data:www-data /var/www/html/database
chmod -R 755 /var/www/html/database

echo "Database initialization completed!" 