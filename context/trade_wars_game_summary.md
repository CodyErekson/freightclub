# Freight Club

**Freight Club** is a fast-paced, strategic, web-based multiplayer commodity trading game. Players compete over a configurable number of turns (weeks) to accumulate the greatest wealth through buying, selling, and transporting goods across the globe.

## Game Structure

- **Turn Duration:** Each turn represents **one week**.
- **Game Length:** A standard game runs for **52 weeks** (1 year), but this is configurable.
- **Players:** 2–6 players (modifiable).
- **Victory Condition:** Player with the highest net worth (cash + asset value) at the end of the final week wins.

## Economic Loops

Players can specialize or diversify among three distinct commodity loops. Each city imports a resource directly used to produce its export, creating clear trade incentives.

### Loop 1: Technology & Manufacturing

| City                 | Imports              | Exports              | Next City        |
| -------------------- | -------------------- | -------------------- | ---------------- |
| **Rotterdam 🇳🇱**   | Petroleum            | Plastics             | Hamburg 🇩🇪     |
| **Hamburg 🇩🇪**     | Plastics             | Industrial Machinery | Shanghai 🇨🇳    |
| **Shanghai 🇨🇳**    | Industrial Machinery | Consumer Electronics | Busan 🇰🇷       |
| **Busan 🇰🇷**       | Consumer Electronics | Automobiles          | Los Angeles 🇺🇸 |
| **Los Angeles 🇺🇸** | Automobiles          | Petroleum            | Rotterdam 🇳🇱   |

### Loop 2: Agriculture & Food Processing

| City               | Imports                | Exports                | Next City      |
| ------------------ | ---------------------- | ---------------------- | -------------- |
| **Houston 🇺🇸**   | Fertilizer & Chemicals | Agricultural Goods     | Santos 🇧🇷    |
| **Santos 🇧🇷**    | Agricultural Goods     | Sugar                  | Singapore 🇸🇬 |
| **Singapore 🇸🇬** | Sugar                  | Processed Foods        | New York 🇺🇸  |
| **New York 🇺🇸**  | Processed Foods        | Fertilizer & Chemicals | Houston 🇺🇸   |

### Loop 3: Metals & Mining Production

| City               | Imports          | Exports          | Next City      |
| ------------------ | ---------------- | ---------------- | -------------- |
| **Dubai 🇦🇪**     | Mining Equipment | Ores             | Mumbai 🇮🇳    |
| **Mumbai 🇮🇳**    | Ores             | Precious Metals  | Antwerp 🇧🇪   |
| **Antwerp 🇧🇪**   | Precious Metals  | Steel            | Melbourne 🇦🇺 |
| **Melbourne 🇦🇺** | Steel            | Mining Equipment | Dubai 🇦🇪     |

## Gameplay Mechanics

### Trading & Market

- **Limited Markets:** Each city has finite daily (weekly) supply and demand for each commodity.
- **Buy Low, Sell High:** Prices fluctuate per city each week; players compete for scarce market capacity.
- **Market**: Each city will have randomly generated NPCs that are looking to purchase or sell a set number of specific goods at a set price. The price can be bartered within a few percentage points at the time of sale. Players in a city at the same time will be competing to sell first to buyers before their quota is full.
- **Player trading**: Players can see when another player is in the same city as them, and can initiate trade between players or try to sabotage them (sell at a lower price, hire a scammer that can pose as a legitimate trader)

### Travel

- **City-to-City Movement:** Players choose a destination each turn; movement cost is based on distance.
- **Turn Completion:** When all players select their destination or a configurable timer expires, the week advances. Unfinished players remain in their current city.

### Loans & Banking

- **Banker:** Players can take loans from a banker with interest.
- **Interest Accrual:** Loans accrue interest each turn.
- **Bonds Market**: Players can purchase bonds which earn interest, but those funds cannot be used to trade with until a bond is sold.
- **Default Mechanic:** If player makes no loan payments for 60 days (8 turns) they go into default. In default:
  - The banker seizes assets up to the outstanding debt.
  - Player resumes with zero debt but reduced asset base.
  - If a player has no assets or money, they are bankrupt and lose the game, unable to continue.

### Regulators & Customs

- **Regulatory Events:** Random weekly events by trade regulators and customs authorities, such as:
  - **Tariff Hikes:** Increased costs on specific imports.
  - **Quotas:** Reduced market capacity for certain commodities.
  - **Audits:** Fines or temporary market suspensions for non-compliance.
- Events can affect individual players or all participants.

## Strategy Tips

- **Loop Focus:** Specializing in a loop can yield high consistent profits, but diversification can hedge against regulatory events.
- **Timing & Speed:** Use the timer wisely; delays can cost valuable trade windows.
- **Loan Management:** Taking loans can accelerate growth but carries default risk.
- **Regulator Awareness:** Monitor regulatory trends and adjust routes to avoid costly events.

## Tech & Implementation

- **Frontend**: Simple Web UI (React).
	- Shows real-time updates via MQTT.
	- Easy actions: Buy/Sell/Select City, visible countdown timer.
- **Backend**: Node.js backend with sqlite storage. One "save file" (database) per game. Running on a Raspberry Pi serving as the web server on a local area network.
- **Real-time Communications**: MQTT broker for event broadcasting, timers, and synchronization.