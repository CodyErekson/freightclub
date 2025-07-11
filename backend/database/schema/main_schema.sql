-- Main Database Schema for Trade Wars Game Configurations
-- This database contains game configurations, cities, commodities, traders, events, and event types

-- Configurations table for game settings
CREATE TABLE IF NOT EXISTS configurations (
    name TEXT PRIMARY KEY NOT NULL,
    value TEXT NOT NULL
);

-- Cities table for game locations
CREATE TABLE IF NOT EXISTS cities (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    primary_export TEXT,
    primary_import TEXT
);

-- Commodities table for tradeable goods
CREATE TABLE IF NOT EXISTS commodities (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    icon TEXT,
    base_price DECIMAL(10,2) NOT NULL DEFAULT 0.00
);

-- Traders table for NPC traders in cities
CREATE TABLE IF NOT EXISTS traders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    icon TEXT,
    city_id INTEGER NOT NULL,
    FOREIGN KEY (city_id) REFERENCES cities(id) ON DELETE CASCADE
);

-- Event types table for different types of events
CREATE TABLE IF NOT EXISTS event_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    consequence TEXT NOT NULL
);

-- Events table for game events
CREATE TABLE IF NOT EXISTS events (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    headline TEXT NOT NULL,
    event_type_id INTEGER NOT NULL,
    city_id INTEGER,
    FOREIGN KEY (event_type_id) REFERENCES event_types(id) ON DELETE CASCADE,
    FOREIGN KEY (city_id) REFERENCES cities(id) ON DELETE CASCADE
);

-- City distances table for travel costs
CREATE TABLE IF NOT EXISTS city_distances (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    from_city_id INTEGER NOT NULL,
    to_city_id INTEGER NOT NULL,
    distance_km DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (from_city_id) REFERENCES cities(id) ON DELETE CASCADE,
    FOREIGN KEY (to_city_id) REFERENCES cities(id) ON DELETE CASCADE,
    UNIQUE(from_city_id, to_city_id)
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_cities_name ON cities(name);
CREATE INDEX IF NOT EXISTS idx_commodities_name ON commodities(name);
CREATE INDEX IF NOT EXISTS idx_traders_city_id ON traders(city_id);
CREATE INDEX IF NOT EXISTS idx_events_event_type_id ON events(event_type_id);
CREATE INDEX IF NOT EXISTS idx_events_city_id ON events(city_id);
CREATE INDEX IF NOT EXISTS idx_city_distances_from ON city_distances(from_city_id);
CREATE INDEX IF NOT EXISTS idx_city_distances_to ON city_distances(to_city_id); 