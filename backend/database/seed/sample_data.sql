-- Sample data for Trade Wars game
-- This file contains initial data for the main database

-- Insert sample configurations
INSERT OR REPLACE INTO configurations (name, value) VALUES
('game_name', 'Freight Club'),
('starting_cash', '10000.00'),
('starting_debt', '10000.00'),
('max_turns', '52'),
('interest_rate', '0.10'),
('default_travel_cost', '100.00'),
('timed_turns', false);

-- Insert sample cities
INSERT OR REPLACE INTO cities (id, name, primary_export, primary_import) VALUES
(1, 'Rotterdam', 2, 1),    -- Plastics, Petroleum
(2, 'Hamburg', 3, 2),      -- Industrial Machinery, Plastics
(3, 'Shanghai', 4, 3),     -- Consumer Electronics, Industrial Machinery
(4, 'Busan', 5, 4),        -- Automobiles, Consumer Electronics
(5, 'Los Angeles', 1, 5),  -- Petroleum, Automobiles
(6, 'Houston', 6, 7),      -- Agricultural Goods, Fertilizer
(7, 'Santos', 8, 6),       -- Sugar, Agricultural Goods
(8, 'Singapore', 9, 8),    -- Processed Foods, Sugar
(9, 'New York', 7, 9),     -- Fertilizer, Processed Foods
(10, 'Dubai', 10, 13),     -- Ores, Mining Equipment
(11, 'Mumbai', 11, 10),    -- Precious Metals, Ores
(12, 'Antwerp', 12, 11),   -- Steel, Precious Metals
(13, 'Melbourne', 13, 12); -- Mining Equipment, Steel

-- Insert sample commodities
INSERT OR REPLACE INTO commodities (id, name, icon, base_price) VALUES
(1, 'Petroleum', 'anonymous.png', 60.00),
(2, 'Plastics', 'anonymous.png', 45.00),
(3, 'Industrial Machinery', 'anonymous.png', 200.00),
(4, 'Consumer Electronics', 'anonymous.png', 150.00),
(5, 'Automobiles', 'anonymous.png', 250.00),
(6, 'Agricultural Goods', 'anonymous.png', 15.00),
(7, 'Fertilizer', 'anonymous.png', 40.00),
(8, 'Sugar', 'anonymous.png', 10.00),
(9, 'Processed Foods', 'anonymous.png', 50.00),
(10, 'Ores', 'anonymous.png', 80.00),
(11, 'Precious Metals', 'anonymous.png', 400.00),
(12, 'Steel', 'anonymous.png', 100.00),
(13, 'Mining Equipment', 'anonymous.png', 300.00);

-- Insert sample traders
INSERT OR REPLACE INTO traders (id, name, icon, city_id) VALUES
(1, 'Hans Mueller', 'anonymous.png', 1),
(2, 'Klaus Weber', 'anonymous.png', 2),
(3, 'Li Wei', 'anonymous.png', 3),
(4, 'Kim Ji-hoon', 'anonymous.png', 4),
(5, 'Mike Johnson', 'anonymous.png', 5),
(6, 'Sarah Williams', 'anonymous.png', 6),
(7, 'Carlos Silva', 'anonymous.png', 7),
(8, 'Ahmed Al-Rashid', 'anonymous.png', 8),
(9, 'David Chen', 'anonymous.png', 9),
(10, 'Raj Patel', 'anonymous.png', 10),
(11, 'Priya Sharma', 'anonymous.png', 11),
(12, 'Pierre Dubois', 'anonymous.png', 12),
(13, 'James Wilson', 'anonymous.png', 13),
(14, 'Anna van der Berg', 'anonymous.png', 1),
(15, 'Wolfgang Schmidt', 'anonymous.png', 2),
(16, 'Zhang Ming', 'anonymous.png', 3),
(17, 'Park Soo-jin', 'anonymous.png', 4),
(18, 'Jennifer Martinez', 'anonymous.png', 5),
(19, 'Robert Thompson', 'anonymous.png', 6),
(20, 'Maria Santos', 'anonymous.png', 7),
(21, 'Lee Wei Ling', 'anonymous.png', 8),
(22, 'John Connor', 'anonymous.png', 9),
(23, 'Fatima Al-Zahra', 'anonymous.png', 10),
(24, 'Arjun Singh', 'anonymous.png', 11),
(25, 'Marie-Claire Rousseau', 'anonymous.png', 12),
(26, 'Emma Thompson', 'anonymous.png', 13);

-- Insert sample event types
INSERT OR REPLACE INTO event_types (id, name, consequence) VALUES
(1, 'Tariff Increase', 'Import costs increase by 20%'),
(2, 'Quota Reduction', 'Export limits reduced by 50%'),
(3, 'Market Crash', 'All commodity prices drop by 30%'),
(4, 'Economic Boom', 'All commodity prices increase by 25%'),
(5, 'Port Strike', 'Trading suspended for 1 turn'),
(6, 'Currency Devaluation', 'Local prices increase by 15%'),
(7, 'Trade Agreement', 'Import/export costs reduced by 10%'),
(8, 'Natural Disaster', 'Supply reduced by 40%'),
(9, 'Technology Breakthrough', 'Electronics demand increases'),
(10, 'Regulatory Audit', 'Random player fined 5% of cash'),
(11, 'Commodity Price Surge', 'Specific commodity sells for 150% higher price'),
(12, 'Commodity Price Crash', 'Specific commodity sells for 150% lower price');

-- Insert sample events
INSERT OR REPLACE INTO events (id, headline, event_type_id, city_id) VALUES
-- Tariff Increase events (Type 1)
(1, 'EU Imposes New Tariffs on Plastics', 1, 1),
(2, 'US Imposes Tariffs on Steel Imports', 1, 12),
(3, 'China Imposes Tariffs on Agricultural Goods', 1, 6),

-- Quota Reduction events (Type 2)
(4, 'Hamburg Industrial Machinery Strike', 5, 2),
(5, 'EU Reduces Sugar Import Quotas', 2, 7),
(6, 'Japan Reduces Electronics Export Quotas', 2, 3),

-- Market Crash events (Type 3)
(7, 'Los Angeles Petroleum Crisis', 3, 5),
(8, 'Global Economic Recession Hits Markets', 3, 9),
(9, 'Asian Financial Crisis Spreads', 3, 8),

-- Economic Boom events (Type 4)
(10, 'Shanghai Electronics Market Boom', 4, 3),
(11, 'Busan Auto Industry Thrives', 4, 4),
(12, 'Houston Agricultural Boom', 4, 6),
(13, 'Mumbai Precious Metals Boom', 4, 11),
(14, 'European Economic Recovery', 4, 1),
(15, 'North American Manufacturing Revival', 4, 5),

-- Port Strike events (Type 5)
(16, 'New York Chemical Industry Strike', 5, 9),
(17, 'Rotterdam Port Workers Strike', 5, 1),
(18, 'Los Angeles Dock Workers Walkout', 5, 5),

-- Currency Devaluation events (Type 6)
(19, 'Brazilian Real Devaluation', 6, 7),
(20, 'Russian Ruble Crisis', 6, 10),

-- Trade Agreement events (Type 7)
(21, 'US-EU Trade Agreement Signed', 7, 9),
(22, 'ASEAN Free Trade Agreement', 7, 8),

-- Natural Disaster events (Type 8)
(23, 'Santos Sugar Harvest Fails', 8, 7),
(24, 'Dubai Mining Equipment Shortage', 8, 10),
(25, 'Hurricane Devastates Houston Port', 8, 6),
(26, 'Earthquake Damages Shanghai Infrastructure', 8, 3),

-- Technology Breakthrough events (Type 9)
(27, 'Singapore Food Processing Innovation', 9, 8),
(28, 'Melbourne Mining Equipment Innovation', 9, 13),
(29, 'Green Energy Revolution in Europe', 9, 1),
(30, 'AI Manufacturing Breakthrough in Asia', 9, 3),

-- Regulatory Audit events (Type 10)
(31, 'Global Banking Compliance Crackdown', 10, 9),
(32, 'International Trade Standards Enforcement', 10, 8),

-- Commodity Price Surge events (Type 11)
(33, 'Petroleum Supply Crisis Drives Prices Up', 11, 5),
(34, 'Plastics Manufacturing Boom', 11, 1),
(35, 'Industrial Machinery Demand Surge', 11, 2),
(36, 'Consumer Electronics Shortage', 11, 3),
(37, 'Automobile Export Boom', 11, 4),
(38, 'Agricultural Goods Export Surge', 11, 6),
(39, 'Fertilizer Supply Shortage', 11, 9),
(40, 'Sugar Production Crisis', 11, 7),
(41, 'Processed Foods Export Boom', 11, 8),
(42, 'Ores Mining Boom', 11, 10),
(43, 'Precious Metals Market Surge', 11, 11),
(44, 'Steel Manufacturing Boom', 11, 12),
(45, 'Mining Equipment Export Surge', 11, 13),

-- Commodity Price Crash events (Type 12)
(46, 'Antwerp Steel Market Crash', 3, 12),
(47, 'Petroleum Glut Crashes Prices', 12, 5),
(48, 'Plastics Oversupply Crisis', 12, 1),
(49, 'Industrial Machinery Market Saturation', 12, 2),
(50, 'Consumer Electronics Price War', 12, 3),
(51, 'Automobile Market Crash', 12, 4),
(52, 'Agricultural Goods Oversupply', 12, 6),
(53, 'Fertilizer Market Collapse', 12, 9),
(54, 'Sugar Production Surplus', 12, 7),
(55, 'Processed Foods Market Saturation', 12, 8),
(56, 'Ores Mining Oversupply', 12, 10),
(57, 'Precious Metals Market Crash', 12, 11),
(58, 'Steel Manufacturing Glut', 12, 12),
(59, 'Mining Equipment Market Saturation', 12, 13);

-- Insert city distances (real-world distances in kilometers)
-- Rotterdam to other cities
INSERT OR REPLACE INTO city_distances (from_city_id, to_city_id, distance_km) VALUES
(1, 2, 450.0),   -- Rotterdam to Hamburg
(1, 3, 8200.0),  -- Rotterdam to Shanghai
(1, 4, 8500.0),  -- Rotterdam to Busan
(1, 5, 8900.0),  -- Rotterdam to Los Angeles
(1, 6, 7800.0),  -- Rotterdam to Houston
(1, 7, 9500.0),  -- Rotterdam to Santos
(1, 8, 10500.0), -- Rotterdam to Singapore
(1, 9, 5900.0),  -- Rotterdam to New York
(1, 10, 5200.0), -- Rotterdam to Dubai
(1, 11, 7200.0), -- Rotterdam to Mumbai
(1, 12, 120.0),  -- Rotterdam to Antwerp
(1, 13, 16500.0); -- Rotterdam to Melbourne

-- Hamburg to other cities
INSERT OR REPLACE INTO city_distances (from_city_id, to_city_id, distance_km) VALUES
(2, 3, 8400.0),  -- Hamburg to Shanghai
(2, 4, 8700.0),  -- Hamburg to Busan
(2, 5, 9200.0),  -- Hamburg to Los Angeles
(2, 6, 8200.0),  -- Hamburg to Houston
(2, 7, 9900.0),  -- Hamburg to Santos
(2, 8, 10700.0), -- Hamburg to Singapore
(2, 9, 6300.0),  -- Hamburg to New York
(2, 10, 5400.0), -- Hamburg to Dubai
(2, 11, 7400.0), -- Hamburg to Mumbai
(2, 12, 570.0),  -- Hamburg to Antwerp
(2, 13, 16800.0); -- Hamburg to Melbourne

-- Shanghai to other cities
INSERT OR REPLACE INTO city_distances (from_city_id, to_city_id, distance_km) VALUES
(3, 4, 800.0),   -- Shanghai to Busan
(3, 5, 10000.0), -- Shanghai to Los Angeles
(3, 6, 12000.0), -- Shanghai to Houston
(3, 7, 18000.0), -- Shanghai to Santos
(3, 8, 3800.0),  -- Shanghai to Singapore
(3, 9, 11000.0), -- Shanghai to New York
(3, 10, 6500.0), -- Shanghai to Dubai
(3, 11, 4800.0), -- Shanghai to Mumbai
(3, 12, 8200.0), -- Shanghai to Antwerp
(3, 13, 8000.0); -- Shanghai to Melbourne

-- Busan to other cities
INSERT OR REPLACE INTO city_distances (from_city_id, to_city_id, distance_km) VALUES
(4, 5, 9500.0),  -- Busan to Los Angeles
(4, 6, 11500.0), -- Busan to Houston
(4, 7, 17500.0), -- Busan to Santos
(4, 8, 4200.0),  -- Busan to Singapore
(4, 9, 11000.0), -- Busan to New York
(4, 10, 7300.0), -- Busan to Dubai
(4, 11, 5600.0), -- Busan to Mumbai
(4, 12, 8800.0), -- Busan to Antwerp
(4, 13, 8500.0); -- Busan to Melbourne

-- Los Angeles to other cities
INSERT OR REPLACE INTO city_distances (from_city_id, to_city_id, distance_km) VALUES
(5, 6, 2200.0),  -- Los Angeles to Houston
(5, 7, 9500.0),  -- Los Angeles to Santos
(5, 8, 14000.0), -- Los Angeles to Singapore
(5, 9, 3900.0),  -- Los Angeles to New York
(5, 10, 13000.0), -- Los Angeles to Dubai
(5, 11, 15000.0), -- Los Angeles to Mumbai
(5, 12, 8200.0), -- Los Angeles to Antwerp
(5, 13, 12500.0); -- Los Angeles to Melbourne

-- Houston to other cities
INSERT OR REPLACE INTO city_distances (from_city_id, to_city_id, distance_km) VALUES
(6, 7, 7800.0),  -- Houston to Santos
(6, 8, 16500.0), -- Houston to Singapore
(6, 9, 2200.0),  -- Houston to New York
(6, 10, 13000.0), -- Houston to Dubai
(6, 11, 15000.0), -- Houston to Mumbai
(6, 12, 8200.0), -- Houston to Antwerp
(6, 13, 15000.0); -- Houston to Melbourne

-- Santos to other cities
INSERT OR REPLACE INTO city_distances (from_city_id, to_city_id, distance_km) VALUES
(7, 8, 15500.0), -- Santos to Singapore
(7, 9, 7800.0),  -- Santos to New York
(7, 10, 12000.0), -- Santos to Dubai
(7, 11, 14000.0), -- Santos to Mumbai
(7, 12, 9500.0), -- Santos to Antwerp
(7, 13, 13500.0); -- Santos to Melbourne

-- Singapore to other cities
INSERT OR REPLACE INTO city_distances (from_city_id, to_city_id, distance_km) VALUES
(8, 9, 15500.0), -- Singapore to New York
(8, 10, 5500.0), -- Singapore to Dubai
(8, 11, 4200.0), -- Singapore to Mumbai
(8, 12, 10500.0), -- Singapore to Antwerp
(8, 13, 6300.0); -- Singapore to Melbourne

-- New York to other cities
INSERT OR REPLACE INTO city_distances (from_city_id, to_city_id, distance_km) VALUES
(9, 10, 11000.0), -- New York to Dubai
(9, 11, 12000.0), -- New York to Mumbai
(9, 12, 5900.0), -- New York to Antwerp
(9, 13, 16000.0); -- New York to Melbourne

-- Dubai to other cities
INSERT OR REPLACE INTO city_distances (from_city_id, to_city_id, distance_km) VALUES
(10, 11, 2200.0), -- Dubai to Mumbai
(10, 12, 5200.0), -- Dubai to Antwerp
(10, 13, 12000.0); -- Dubai to Melbourne

-- Mumbai to other cities
INSERT OR REPLACE INTO city_distances (from_city_id, to_city_id, distance_km) VALUES
(11, 12, 7200.0), -- Mumbai to Antwerp
(11, 13, 10000.0); -- Mumbai to Melbourne

-- Antwerp to Melbourne
INSERT OR REPLACE INTO city_distances (from_city_id, to_city_id, distance_km) VALUES
(12, 13, 16500.0); -- Antwerp to Melbourne

-- Insert sample player sprites
INSERT OR REPLACE INTO player_sprites (id, name, filename, description) VALUES
(1, 'Trader Alex', 'trader_alex.png', 'A confident young trader with a briefcase'),
(2, 'Captain Maria', 'captain_maria.png', 'A seasoned sea captain with navigation experience'),
(3, 'Merchant Chen', 'merchant_chen.png', 'A wise merchant with traditional trading knowledge'),
(4, 'Broker Sarah', 'broker_sarah.png', 'A sharp financial broker with market expertise'),
(5, 'Exporter Pierre', 'exporter_pierre.png', 'A French export specialist with global connections'),
(6, 'Importer Fatima', 'importer_fatima.png', 'A Middle Eastern import expert with local knowledge'),
(7, 'Logistics Manager', 'logistics_manager.png', 'A logistics expert who optimizes trade routes'),
(8, 'Commodity Trader', 'commodity_trader.png', 'A specialist in raw materials and commodities'),
(9, 'Port Master', 'port_master.png', 'A port authority with shipping network access'),
(10, 'Trade Negotiator', 'trade_negotiator.png', 'A skilled negotiator who gets the best deals'),
(11, 'Market Analyst', 'market_analyst.png', 'An analyst who predicts market trends'),
(12, 'Supply Chain Expert', 'supply_chain_expert.png', 'An expert in supply chain optimization'),
(13, 'Freight Forwarder', 'freight_forwarder.png', 'A forwarder who handles complex shipments'),
(14, 'Customs Broker', 'customs_broker.png', 'A broker who navigates customs regulations'),
(15, 'Trade Consultant', 'trade_consultant.png', 'A consultant who advises on trade strategies'),
(16, 'Shipping Agent', 'shipping_agent.png', 'An agent who manages shipping operations'),
(17, 'Warehouse Manager', 'warehouse_manager.png', 'A manager who oversees storage operations'),
(18, 'Trade Representative', 'trade_representative.png', 'A representative who builds trade relationships'),
(19, 'Market Maker', 'market_maker.png', 'A market maker who provides liquidity'),
(20, 'Trade Arbitrageur', 'trade_arbitrageur.png', 'An arbitrageur who exploits price differences'); 