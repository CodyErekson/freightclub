import React from 'react';
import CommodityIcon from './CommodityIcon';

/**
 * Demo component showing all commodity icons
 */
const CommodityDemo = () => {
  const commodities = [
    'petroleum',
    'plastics', 
    'industrial_machinery',
    'consumer_electronics',
    'automobiles',
    'agricultural_goods',
    'fertilizer_chemicals',
    'sugar',
    'processed_foods',
    'ores',
    'precious_metals',
    'steel',
    'mining_equipment',
    'anonymous'
  ];

  const handleCommodityClick = (commodity) => {
    console.log('Clicked commodity:', commodity);
  };

  return (
    <div style={{ padding: '20px' }}>
      <h2>Commodity Icons Demo</h2>
      <p>All icons are loaded from a single sprite sheet for better performance.</p>
      
      <div style={{ marginBottom: '20px' }}>
        <h3>Small Icons (24px)</h3>
        <div style={{ display: 'flex', flexWrap: 'wrap', gap: '10px' }}>
          {commodities.map(commodity => (
            <div key={commodity} style={{ textAlign: 'center' }}>
              <CommodityIcon 
                commodity={commodity} 
                size={24}
                onClick={() => handleCommodityClick(commodity)}
                title={commodity}
              />
              <div style={{ fontSize: '10px', marginTop: '2px' }}>
                {commodity.replace('_', ' ')}
              </div>
            </div>
          ))}
        </div>
      </div>

      <div style={{ marginBottom: '20px' }}>
        <h3>Medium Icons (32px)</h3>
        <div style={{ display: 'flex', flexWrap: 'wrap', gap: '10px' }}>
          {commodities.map(commodity => (
            <div key={commodity} style={{ textAlign: 'center' }}>
              <CommodityIcon 
                commodity={commodity} 
                size={32}
                onClick={() => handleCommodityClick(commodity)}
                title={commodity}
              />
              <div style={{ fontSize: '12px', marginTop: '4px' }}>
                {commodity.replace('_', ' ')}
              </div>
            </div>
          ))}
        </div>
      </div>

      <div style={{ marginBottom: '20px' }}>
        <h3>Large Icons (48px)</h3>
        <div style={{ display: 'flex', flexWrap: 'wrap', gap: '15px' }}>
          {commodities.map(commodity => (
            <div key={commodity} style={{ textAlign: 'center' }}>
              <CommodityIcon 
                commodity={commodity} 
                size={48}
                onClick={() => handleCommodityClick(commodity)}
                title={commodity}
              />
              <div style={{ fontSize: '14px', marginTop: '6px' }}>
                {commodity.replace('_', ' ')}
              </div>
            </div>
          ))}
        </div>
      </div>

      <div style={{ 
        backgroundColor: '#f5f5f5', 
        padding: '15px', 
        borderRadius: '5px',
        marginTop: '20px'
      }}>
        <h4>Performance Benefits:</h4>
        <ul>
          <li>Single HTTP request for all commodity icons</li>
          <li>Reduced memory usage</li>
          <li>Faster loading times</li>
          <li>Consistent rendering across browsers</li>
        </ul>
      </div>
    </div>
  );
};

export default CommodityDemo; 