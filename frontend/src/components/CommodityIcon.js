import React, { useEffect, useRef, useState } from 'react';
import spriteAtlas from '../utils/spriteAtlas';

/**
 * CommodityIcon Component
 * Displays a commodity icon using the sprite atlas
 */
const CommodityIcon = ({ 
  commodity, 
  size = 32, 
  className = '', 
  onClick = null,
  title = null 
}) => {
  const canvasRef = useRef(null);
  const [isLoaded, setIsLoaded] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    const loadSprite = async () => {
      try {
        // Initialize the sprite atlas if not already done
        if (!spriteAtlas.loaded) {
          spriteAtlas.defineSprites();
          await spriteAtlas.loadSpritesheet();
        }

        // Draw the sprite on the canvas
        const canvas = canvasRef.current;
        if (canvas && spriteAtlas.loaded) {
          const scale = size / 32; // Assuming original sprites are 32x32
          spriteAtlas.drawSprite(commodity, canvas, 0, 0, scale);
          setIsLoaded(true);
        }
      } catch (err) {
        console.error('Failed to load commodity sprite:', err);
        setError(err.message);
      }
    };

    loadSprite();
  }, [commodity, size]);

  if (error) {
    return (
      <div 
        className={`commodity-icon error ${className}`}
        style={{ 
          width: size, 
          height: size, 
          backgroundColor: '#f0f0f0',
          border: '1px solid #ccc',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          fontSize: size * 0.3
        }}
        title={title || commodity}
        onClick={onClick}
      >
        ?
      </div>
    );
  }

  return (
    <canvas
      ref={canvasRef}
      width={size}
      height={size}
      className={`commodity-icon ${className}`}
      style={{
        imageRendering: 'pixelated',
        cursor: onClick ? 'pointer' : 'default'
      }}
      title={title || commodity}
      onClick={onClick}
    />
  );
};

export default CommodityIcon; 