#!/bin/bash

# Game Session Database Creation Script
# This script creates a new game session database file

set -e

# Check if session name is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <session_name>"
    echo "Example: $0 game_session_001"
    exit 1
fi

SESSION_NAME=$1
SESSION_DB="/var/www/html/database/sessions/${SESSION_NAME}.db"

# Create sessions directory if it doesn't exist
mkdir -p /var/www/html/database/sessions

echo "Creating game session database: $SESSION_DB"

# Create the session database and apply schema
sqlite3 "$SESSION_DB" < /var/www/html/database/schema/game_session_schema.sql

# Initialize game state
sqlite3 "$SESSION_DB" "INSERT INTO game_state (current_turn, max_turns, status) VALUES (1, 52, 'active');"

# Set proper permissions
chown -R www-data:www-data /var/www/html/database/sessions
chmod -R 755 /var/www/html/database/sessions

echo "Game session database created successfully at $SESSION_DB"
echo "Session name: $SESSION_NAME" 