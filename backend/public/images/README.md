# Trade Wars Game Icons

This directory contains PNG image files used by the game UI to display icons for commodities, traders, and other game elements.

## File Structure

```
images/
├── commodities/     # Commodity icons
├── traders/        # Trader portraits
├── cities/         # City icons/flags
└── ui/            # UI element icons
```

## Icon Naming Convention

- **Commodities**: `commodity_name.png` (e.g., `petroleum.png`, `plastics.png`)
- **Traders**: `trader_name.png` (e.g., `hans_mueller.png`, `li_wei.png`)
- **Cities**: `city_name.png` (e.g., `rotterdam.png`, `shanghai.png`)

## Default Icon

- `anonymous.png` - Default placeholder icon used when specific icons are not available

## Usage

Icons are referenced in the database by filename and loaded by the frontend UI components. 