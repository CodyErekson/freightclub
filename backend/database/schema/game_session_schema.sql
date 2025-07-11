-- Game Session Database Schema for Trade Wars Game Saves
-- This schema is used for individual game sessions and serves as a save file

-- Game state table for overall game information
CREATE TABLE IF NOT EXISTS game_state (
    id INTEGER PRIMARY KEY DEFAULT 1,
    current_turn INTEGER NOT NULL DEFAULT 1,
    max_turns INTEGER NOT NULL DEFAULT 52,
    game_started_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    game_ended_at DATETIME,
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'paused', 'completed', 'cancelled'))
);

-- Players table for game participants
CREATE TABLE IF NOT EXISTS players (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    cash DECIMAL(12,2) NOT NULL DEFAULT 10000.00,
    current_city_id INTEGER NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_active_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (current_city_id) REFERENCES cities(id)
);

-- Player holdings table for commodity inventory
CREATE TABLE IF NOT EXISTS player_holdings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    player_id INTEGER NOT NULL,
    commodity_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 0,
    average_cost DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE,
    FOREIGN KEY (commodity_id) REFERENCES commodities(id) ON DELETE CASCADE,
    UNIQUE(player_id, commodity_id)
);

-- Markets table for current market conditions
CREATE TABLE IF NOT EXISTS markets (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    city_id INTEGER NOT NULL,
    commodity_id INTEGER NOT NULL,
    current_price DECIMAL(10,2) NOT NULL,
    supply INTEGER NOT NULL DEFAULT 0,
    demand INTEGER NOT NULL DEFAULT 0,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (city_id) REFERENCES cities(id) ON DELETE CASCADE,
    FOREIGN KEY (commodity_id) REFERENCES commodities(id) ON DELETE CASCADE,
    UNIQUE(city_id, commodity_id)
);

-- Transactions table for trade history
CREATE TABLE IF NOT EXISTS transactions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    player_id INTEGER NOT NULL,
    city_id INTEGER NOT NULL,
    commodity_id INTEGER NOT NULL,
    transaction_type TEXT NOT NULL CHECK (transaction_type IN ('buy', 'sell')),
    quantity INTEGER NOT NULL,
    price_per_unit DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE,
    FOREIGN KEY (city_id) REFERENCES cities(id) ON DELETE CASCADE,
    FOREIGN KEY (commodity_id) REFERENCES commodities(id) ON DELETE CASCADE
);

-- Loans table for player debt
CREATE TABLE IF NOT EXISTS loans (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    player_id INTEGER NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    interest_rate DECIMAL(5,4) NOT NULL DEFAULT 0.10,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    due_date DATETIME,
    is_paid BOOLEAN NOT NULL DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE
);

-- Bonds table for player investments
CREATE TABLE IF NOT EXISTS bonds (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    player_id INTEGER NOT NULL,
    face_value DECIMAL(12,2) NOT NULL,
    purchase_price DECIMAL(12,2) NOT NULL,
    interest_rate DECIMAL(5,4) NOT NULL,
    maturity_date DATETIME NOT NULL,
    is_matured BOOLEAN NOT NULL DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE
);

-- Game events table for session-specific events
CREATE TABLE IF NOT EXISTS game_events (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    event_id INTEGER NOT NULL,
    occurred_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    affected_player_id INTEGER,
    affected_city_id INTEGER,
    details TEXT,
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE,
    FOREIGN KEY (affected_player_id) REFERENCES players(id) ON DELETE CASCADE,
    FOREIGN KEY (affected_city_id) REFERENCES cities(id) ON DELETE CASCADE
);

-- Player movement history
CREATE TABLE IF NOT EXISTS player_movements (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    player_id INTEGER NOT NULL,
    from_city_id INTEGER,
    to_city_id INTEGER NOT NULL,
    travel_cost DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    movement_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE,
    FOREIGN KEY (from_city_id) REFERENCES cities(id) ON DELETE CASCADE,
    FOREIGN KEY (to_city_id) REFERENCES cities(id) ON DELETE CASCADE
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_players_current_city ON players(current_city_id);
CREATE INDEX IF NOT EXISTS idx_player_holdings_player ON player_holdings(player_id);
CREATE INDEX IF NOT EXISTS idx_player_holdings_commodity ON player_holdings(commodity_id);
CREATE INDEX IF NOT EXISTS idx_markets_city_commodity ON markets(city_id, commodity_id);
CREATE INDEX IF NOT EXISTS idx_transactions_player ON transactions(player_id);
CREATE INDEX IF NOT EXISTS idx_transactions_date ON transactions(transaction_date);
CREATE INDEX IF NOT EXISTS idx_loans_player ON loans(player_id);
CREATE INDEX IF NOT EXISTS idx_bonds_player ON bonds(player_id);
CREATE INDEX IF NOT EXISTS idx_game_events_event ON game_events(event_id);
CREATE INDEX IF NOT EXISTS idx_player_movements_player ON player_movements(player_id);
CREATE INDEX IF NOT EXISTS idx_player_movements_date ON player_movements(movement_date); 