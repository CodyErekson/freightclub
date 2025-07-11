#!/usr/bin/env python3
"""
Generate sprite-quality commodity icons for the Freight Club game.
Creates 32x32 pixel PNG images with consistent styling.
"""

from PIL import Image, ImageDraw, ImageFont
import os

# Create output directory
output_dir = "backend/public/images/commodities"
os.makedirs(output_dir, exist_ok=True)

# Define commodity colors and styles
commodities = {
    "petroleum": {"color": (25, 25, 25), "bg_color": (50, 50, 50), "symbol": "⚫"},
    "plastics": {"color": (0, 150, 255), "bg_color": (0, 100, 200), "symbol": "🔷"},
    "industrial_machinery": {"color": (100, 100, 100), "bg_color": (150, 150, 150), "symbol": "⚙️"},
    "consumer_electronics": {"color": (0, 200, 0), "bg_color": (0, 150, 0), "symbol": "📱"},
    "automobiles": {"color": (200, 0, 0), "bg_color": (150, 0, 0), "symbol": "🚗"},
    "agricultural_goods": {"color": (139, 69, 19), "bg_color": (160, 82, 45), "symbol": "🌾"},
    "fertilizer_chemicals": {"color": (255, 215, 0), "bg_color": (218, 165, 32), "symbol": "🧪"},
    "sugar": {"color": (255, 255, 255), "bg_color": (245, 245, 245), "symbol": "🍯"},
    "processed_foods": {"color": (255, 165, 0), "bg_color": (255, 140, 0), "symbol": "🍞"},
    "ores": {"color": (105, 105, 105), "bg_color": (128, 128, 128), "symbol": "⛏️"},
    "precious_metals": {"color": (255, 215, 0), "bg_color": (218, 165, 32), "symbol": "💎"},
    "steel": {"color": (192, 192, 192), "bg_color": (169, 169, 169), "symbol": "🔩"},
    "mining_equipment": {"color": (139, 69, 19), "bg_color": (160, 82, 45), "symbol": "⛏️"},
    "anonymous": {"color": (128, 128, 128), "bg_color": (169, 169, 169), "symbol": "❓"}
}

def create_sprite(name, config):
    """Create a 32x32 sprite for a commodity."""
    # Create image with background
    img = Image.new('RGBA', (32, 32), config["bg_color"])
    draw = ImageDraw.Draw(img)
    
    # Add border
    draw.rectangle([0, 0, 31, 31], outline=(0, 0, 0), width=1)
    
    # Add symbol (using text as emoji)
    try:
        # Try to use a font that supports emoji
        font = ImageFont.truetype("arial.ttf", 16)
    except:
        font = ImageFont.load_default()
    
    # Calculate text position to center it
    bbox = draw.textbbox((0, 0), config["symbol"], font=font)
    text_width = bbox[2] - bbox[0]
    text_height = bbox[3] - bbox[1]
    x = (32 - text_width) // 2
    y = (32 - text_height) // 2
    
    # Draw the symbol
    draw.text((x, y), config["symbol"], fill=config["color"], font=font)
    
    return img

def main():
    """Generate all commodity sprites."""
    print("Generating commodity sprites...")
    
    for name, config in commodities.items():
        filename = f"{name}.png"
        filepath = os.path.join(output_dir, filename)
        
        img = create_sprite(name, config)
        img.save(filepath, "PNG")
        print(f"Created: {filename}")
    
    print(f"\nAll sprites generated in: {output_dir}")

if __name__ == "__main__":
    main() 