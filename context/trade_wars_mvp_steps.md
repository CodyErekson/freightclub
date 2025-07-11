# Trade Wars Hackathon MVP Steps

## 1. Project Scaffold & Environment
- **Repo & Tooling**
  - Initialize a Git repository.
  - Set up Node.js + Express for the backend.
  - Scaffold a React app (e.g., Create-React-App) for the frontend.
  - Provision a local MQTT broker (e.g., Mosquitto) and a SQLite database file.
- **Docker Compose**
  - Create `docker-compose.yml` with services:
    - `backend` (Node.js)
    - `frontend` (React)
    - `mqtt` (Mosquitto)
    - `db` (SQLite volume)

## 2. Data Model & Seeding
- **Define SQLite Schema**
  - Tables: `cities`, `commodities`, `loops`, `players`, `markets`, `transactions`, `loans`, `bonds`, `events`, `game_state`.
- **Seed Initial Data**
  - Populate Loop 1, Loop 2, Loop 3 city chains and commodities (e.g., Rotterdam→Hamburg→…; Houston→Santos→…; Dubai→Mumbai→…).
  - Set starting supplies, demands, base prices.

## 3. Backend API Endpoints
Implement REST endpoints, each in its own module:
1. **Game State**
   - `GET /game/state` → current turn, player locations, cash, holdings, market snapshot
2. **Movement**
   - `POST /player/:id/move` → select next city, record travel cost
3. **Trading**
   - `POST /player/:id/trade` → buy/sell commodity (qty, price)
4. **Banking**
   - `POST /player/:id/loan` → take or repay loan; `POST /player/:id/bond` → buy/sell bonds
5. **Events & Leaderboard**
   - `GET /events` → this week’s regulatory events
   - `GET /leaderboard` → compute net worth = cash + asset value

## 4. Core Game-Logic Modules
1. **Market Simulation**
   - Weekly random NPC buyers/sellers, supply/demand adjustments, price fluctuation
2. **Travel Cost**
   - Predefine a distance matrix; calculate cost per leg
3. **Banking & Default**
   - Interest accrual per turn; default after 8 unpaid turns → asset seizure
4. **Regulatory Events**
   - Tariffs, quotas, audits generator; attach effects to market or individual players

## 5. Turn Engine & Scheduler
- Single “turn processor” service:
  1. Wait for all players’ moves *or* timer expiry.
  2. Run in sequence:
     - **Market Simulation**
     - **Banking Interest**
     - **Regulator Events**
     - **Advance** `game_state.turn++`
  3. Broadcast updated state via MQTT topics (`/game/state`, `/events`)

## 6. Frontend UI Components
Split across two React devs:
1. **Market & Travel UI**
   - Market table: show commodities, prices, supply/demand, trade form
   - Travel panel: list cities, show move cost, submit move
2. **Finance & Events UI**
   - Banking panel: view loans/bonds, take/repay forms
   - Events feed: display weekly regulator audits, tariffs, quotas
   - Leaderboard view: real-time net worth

## 7. Real-Time Integration
- **MQTT Client**
  - Connect React → MQTT broker (e.g., via `mqtt.js`)
  - Subscribe to `/game/state` & `/events`
  - Dispatch Redux (or Context) updates on messages
