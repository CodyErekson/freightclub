/**
 * Sprite Atlas Manager for Commodities
 * Handles loading and extracting sprites from the commodities sprite sheet
 */

class SpriteAtlas {
  constructor() {
    this.spritesheet = null;
    this.spriteData = {};
    this.loaded = false;
  }

  /**
   * Load the sprite sheet image
   * @param {string} imagePath - Path to the sprite sheet
   * @returns {Promise} Promise that resolves when image is loaded
   */
  async loadSpritesheet(imagePath = '/images/commodities/commodities.png') {
    return new Promise((resolve, reject) => {
      this.spritesheet = new Image();
      this.spritesheet.onload = () => {
        this.loaded = true;
        console.log('Sprite sheet loaded:', this.spritesheet.width, 'x', this.spritesheet.height);
        resolve();
      };
      this.spritesheet.onerror = () => {
        reject(new Error('Failed to load sprite sheet'));
      };
      this.spritesheet.src = imagePath;
    });
  }

  /**
   * Define sprite regions in the sprite sheet
   * You'll need to adjust these coordinates based on your actual sprite sheet layout
   */
  defineSprites() {
    // Example sprite definitions - adjust these based on your actual sprite sheet
    // Format: { x, y, width, height }
    this.spriteData = {
      petroleum: { x: 0, y: 0, width: 32, height: 32 },
      plastics: { x: 32, y: 0, width: 32, height: 32 },
      industrial_machinery: { x: 64, y: 0, width: 32, height: 32 },
      consumer_electronics: { x: 96, y: 0, width: 32, height: 32 },
      automobiles: { x: 128, y: 0, width: 32, height: 32 },
      agricultural_goods: { x: 160, y: 0, width: 32, height: 32 },
      fertilizer_chemicals: { x: 192, y: 0, width: 32, height: 32 },
      sugar: { x: 224, y: 0, width: 32, height: 32 },
      processed_foods: { x: 256, y: 0, width: 32, height: 32 },
      ores: { x: 288, y: 0, width: 32, height: 32 },
      precious_metals: { x: 320, y: 0, width: 32, height: 32 },
      steel: { x: 352, y: 0, width: 32, height: 32 },
      mining_equipment: { x: 384, y: 0, width: 32, height: 32 },
      anonymous: { x: 416, y: 0, width: 32, height: 32 }
    };
  }

  /**
   * Get a sprite from the sprite sheet
   * @param {string} spriteName - Name of the sprite to extract
   * @param {HTMLCanvasElement} canvas - Canvas to draw the sprite on
   * @param {number} x - X position to draw at
   * @param {number} y - Y position to draw at
   * @param {number} scale - Scale factor (default: 1)
   */
  drawSprite(spriteName, canvas, x, y, scale = 1) {
    if (!this.loaded || !this.spriteData[spriteName]) {
      console.warn(`Sprite "${spriteName}" not found or sprite sheet not loaded`);
      return;
    }

    const ctx = canvas.getContext('2d');
    const sprite = this.spriteData[spriteName];
    
    ctx.drawImage(
      this.spritesheet,
      sprite.x, sprite.y, sprite.width, sprite.height,
      x, y, sprite.width * scale, sprite.height * scale
    );
  }

  /**
   * Get sprite dimensions
   * @param {string} spriteName - Name of the sprite
   * @returns {Object} { width, height } or null if not found
   */
  getSpriteDimensions(spriteName) {
    if (!this.spriteData[spriteName]) {
      return null;
    }
    return {
      width: this.spriteData[spriteName].width,
      height: this.spriteData[spriteName].height
    };
  }

  /**
   * Create a canvas element with a specific sprite
   * @param {string} spriteName - Name of the sprite
   * @param {number} scale - Scale factor (default: 1)
   * @returns {HTMLCanvasElement} Canvas with the sprite drawn on it
   */
  createSpriteCanvas(spriteName, scale = 1) {
    if (!this.spriteData[spriteName]) {
      console.warn(`Sprite "${spriteName}" not found`);
      return null;
    }

    const sprite = this.spriteData[spriteName];
    const canvas = document.createElement('canvas');
    canvas.width = sprite.width * scale;
    canvas.height = sprite.height * scale;
    
    this.drawSprite(spriteName, canvas, 0, 0, scale);
    return canvas;
  }

  /**
   * Get a data URL for a specific sprite
   * @param {string} spriteName - Name of the sprite
   * @param {number} scale - Scale factor (default: 1)
   * @returns {string} Data URL of the sprite image
   */
  getSpriteDataURL(spriteName, scale = 1) {
    const canvas = this.createSpriteCanvas(spriteName, scale);
    if (!canvas) return null;
    return canvas.toDataURL();
  }

  /**
   * Get all available sprite names
   * @returns {string[]} Array of sprite names
   */
  getAvailableSprites() {
    return Object.keys(this.spriteData);
  }
}

// Create a singleton instance
const spriteAtlas = new SpriteAtlas();

export default spriteAtlas; 