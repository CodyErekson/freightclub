# Trade Wars Database Structure

This directory contains the database schemas and initialization scripts for the Trade Wars game.

## Database Architecture

The game uses a multi-database approach:

### 1. Main Database (`main.db`)
Located at `/var/www/html/database/main.db`

Contains game configurations and static data:
- **configurations**: Game settings and parameters
- **cities**: Game locations with trade specialties
- **commodities**: Tradeable goods with base prices
- **traders**: NPC traders in each city
- **city_distances**: Real-world distances between cities (in kilometers)
- **event_types**: Types of events that can occur
- **events**: Predefined events that can be triggered

### 2. Game Session Databases
Located at `/var/www/html/database/sessions/<session_name>.db`

Each game session has its own database file that serves as a save file:
- **game_state**: Overall game information (turn, status, etc.)
- **players**: Game participants and their current state
- **player_holdings**: Commodity inventory for each player
- **markets**: Current market conditions in each city
- **transactions**: Trade history
- **loans**: Player debt
- **bonds**: Player investments
- **game_events**: Session-specific events
- **player_movements**: Travel history

## File Structure

```
database/
├── schema/
│   ├── main_schema.sql          # Main database schema
│   └── game_session_schema.sql  # Game session schema
├── seed/
│   └── sample_data.sql          # Initial data for main database
├── sessions/                    # Game session databases (created at runtime)
├── init_database.sh            # Main database initialization
├── create_game_session.sh      # Game session creation utility
└── README.md                   # This file
```

## Usage

### Initial Setup
The main database is automatically created when the Docker container starts.

### Creating a New Game Session
```bash
# Inside the Docker container
/var/www/html/database/create_game_session.sh <session_name>

# Example
/var/www/html/database/create_game_session.sh game_001
```

### Database Access
- Main database: `/var/www/html/database/main.db`
- Session databases: `/var/www/html/database/sessions/<session_name>.db`

## Schema Details

### Main Database Tables

#### configurations
- `name` (TEXT, PRIMARY KEY): Configuration key
- `value` (TEXT): Configuration value

#### cities
- `id` (INTEGER, PRIMARY KEY): Unique city identifier
- `name` (TEXT, UNIQUE): City name
- `primary_export` (TEXT): Main export commodity
- `primary_import` (TEXT): Main import commodity

#### commodities
- `id` (INTEGER, PRIMARY KEY): Unique commodity identifier
- `name` (TEXT, UNIQUE): Commodity name
- `icon` (TEXT): Display icon
- `base_price` (DECIMAL): Base price for the commodity

#### traders
- `id` (INTEGER, PRIMARY KEY): Unique trader identifier
- `name` (TEXT): Trader name
- `icon` (TEXT): Display icon
- `city_id` (INTEGER, FOREIGN KEY): City where trader is located

#### event_types
- `id` (INTEGER, PRIMARY KEY): Unique event type identifier
- `name` (TEXT, UNIQUE): Event type name
- `consequence` (TEXT): Description of the event's effect

#### events
- `id` (INTEGER, PRIMARY KEY): Unique event identifier
- `headline` (TEXT): Event headline
- `event_type_id` (INTEGER, FOREIGN KEY): Type of event
- `city_id` (INTEGER, FOREIGN KEY): City where event occurs (optional)

#### city_distances
- `id` (INTEGER, PRIMARY KEY): Unique distance identifier
- `from_city_id` (INTEGER, FOREIGN KEY): Starting city
- `to_city_id` (INTEGER, FOREIGN KEY): Destination city
- `distance_km` (DECIMAL): Real-world distance in kilometers

### Game Session Tables

#### game_state
- `id` (INTEGER, PRIMARY KEY): Always 1
- `current_turn` (INTEGER): Current game turn
- `max_turns` (INTEGER): Maximum number of turns
- `game_started_at` (DATETIME): When the game started
- `game_ended_at` (DATETIME): When the game ended (if completed)
- `status` (TEXT): Game status (active, paused, completed, cancelled)

#### players
- `id` (INTEGER, PRIMARY KEY): Unique player identifier
- `name` (TEXT): Player name
- `cash` (DECIMAL): Current cash balance
- `current_city_id` (INTEGER, FOREIGN KEY): Current location
- `created_at` (DATETIME): When player joined
- `last_active_at` (DATETIME): Last activity timestamp

#### player_holdings
- `id` (INTEGER, PRIMARY KEY): Unique holding identifier
- `player_id` (INTEGER, FOREIGN KEY): Player
- `commodity_id` (INTEGER, FOREIGN KEY): Commodity
- `quantity` (INTEGER): Amount held
- `average_cost` (DECIMAL): Average purchase price

#### markets
- `id` (INTEGER, PRIMARY KEY): Unique market identifier
- `city_id` (INTEGER, FOREIGN KEY): City
- `commodity_id` (INTEGER, FOREIGN KEY): Commodity
- `current_price` (DECIMAL): Current market price
- `supply` (INTEGER): Available supply
- `demand` (INTEGER): Current demand
- `last_updated` (DATETIME): Last market update

#### transactions
- `id` (INTEGER, PRIMARY KEY): Unique transaction identifier
- `player_id` (INTEGER, FOREIGN KEY): Player
- `city_id` (INTEGER, FOREIGN KEY): City where trade occurred
- `commodity_id` (INTEGER, FOREIGN KEY): Commodity traded
- `transaction_type` (TEXT): 'buy' or 'sell'
- `quantity` (INTEGER): Amount traded
- `price_per_unit` (DECIMAL): Price per unit
- `total_amount` (DECIMAL): Total transaction value
- `transaction_date` (DATETIME): When trade occurred

#### loans
- `id` (INTEGER, PRIMARY KEY): Unique loan identifier
- `player_id` (INTEGER, FOREIGN KEY): Player
- `amount` (DECIMAL): Loan amount
- `interest_rate` (DECIMAL): Interest rate
- `created_at` (DATETIME): When loan was taken
- `due_date` (DATETIME): When loan is due
- `is_paid` (BOOLEAN): Whether loan is paid off

#### bonds
- `id` (INTEGER, PRIMARY KEY): Unique bond identifier
- `player_id` (INTEGER, FOREIGN KEY): Player
- `face_value` (DECIMAL): Bond face value
- `purchase_price` (DECIMAL): Price paid for bond
- `interest_rate` (DECIMAL): Bond interest rate
- `maturity_date` (DATETIME): When bond matures
- `is_matured` (BOOLEAN): Whether bond has matured
- `created_at` (DATETIME): When bond was purchased

#### game_events
- `id` (INTEGER, PRIMARY KEY): Unique game event identifier
- `event_id` (INTEGER, FOREIGN KEY): Reference to main events table
- `occurred_at` (DATETIME): When event occurred
- `affected_player_id` (INTEGER, FOREIGN KEY): Player affected (optional)
- `affected_city_id` (INTEGER, FOREIGN KEY): City affected (optional)
- `details` (TEXT): Additional event details

#### player_movements
- `id` (INTEGER, PRIMARY KEY): Unique movement identifier
- `player_id` (INTEGER, FOREIGN KEY): Player
- `from_city_id` (INTEGER, FOREIGN KEY): Starting city (optional)
- `to_city_id` (INTEGER, FOREIGN KEY): Destination city
- `travel_cost` (DECIMAL): Cost of travel
- `movement_date` (DATETIME): When movement occurred 