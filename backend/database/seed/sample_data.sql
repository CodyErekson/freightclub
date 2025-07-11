-- Sample data for Trade Wars game
-- This file contains initial data for the main database

-- Insert sample configurations
INSERT OR REPLACE INTO configurations (name, value) VALUES
('game_name', 'Freight Club'),
('starting_cash', '10000.00'),
('starting_debt', '10000.00'),
('max_turns', '52'),
('interest_rate', '0.10'),
('default_travel_cost', '100.00');

-- Insert sample cities
INSERT OR REPLACE INTO cities (id, name, primary_export, primary_import) VALUES
(1, 'Rotterdam', 'Plastics', 'Petroleum'),
(2, 'Hamburg', 'Industrial Machinery', 'Plastics'),
(3, 'Shanghai', 'Consumer Electronics', 'Industrial Machinery'),
(4, 'Busan', 'Automobiles', 'Consumer Electronics'),
(5, 'Los Angeles', 'Petroleum', 'Automobiles'),
(6, 'Houston', 'Agricultural Goods', 'Fertilizer & Chemicals'),
(7, 'Santos', 'Sugar', 'Agricultural Goods'),
(8, 'Singapore', 'Processed Foods', 'Sugar'),
(9, 'New York', 'Fertilizer & Chemicals', 'Processed Foods'),
(10, 'Dubai', 'Ores', 'Mining Equipment'),
(11, 'Mumbai', 'Precious Metals', 'Ores'),
(12, 'Antwerp', 'Steel', 'Precious Metals'),
(13, 'Melbourne', 'Mining Equipment', 'Steel');

-- Insert sample commodities
INSERT OR REPLACE INTO commodities (id, name, icon, base_price) VALUES
(1, 'Petroleum', 'anonymous.png', 60.00),
(2, 'Plastics', 'anonymous.png', 45.00),
(3, 'Industrial Machinery', 'anonymous.png', 200.00),
(4, 'Consumer Electronics', 'anonymous.png', 150.00),
(5, 'Automobiles', 'anonymous.png', 250.00),
(6, 'Agricultural Goods', 'anonymous.png', 35.00),
(7, 'Fertilizer & Chemicals', 'anonymous.png', 40.00),
(8, 'Sugar', 'anonymous.png', 25.00),
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
(13, 'James Wilson', 'anonymous.png', 13);

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
(10, 'Regulatory Audit', 'Random player fined 5% of cash');

-- Insert sample events
INSERT OR REPLACE INTO events (id, headline, event_type_id, city_id) VALUES
(1, 'EU Imposes New Tariffs on Plastics', 1, 1),
(2, 'Hamburg Industrial Machinery Strike', 5, 2),
(3, 'Shanghai Electronics Market Boom', 4, 3),
(4, 'Busan Auto Industry Thrives', 4, 4),
(5, 'Los Angeles Petroleum Crisis', 3, 5),
(6, 'Houston Agricultural Boom', 4, 6),
(7, 'Santos Sugar Harvest Fails', 8, 7),
(8, 'Singapore Food Processing Innovation', 9, 8),
(9, 'New York Chemical Industry Strike', 5, 9),
(10, 'Dubai Mining Equipment Shortage', 8, 10),
(11, 'Mumbai Precious Metals Boom', 4, 11),
(12, 'Antwerp Steel Market Crash', 3, 12),
(13, 'Melbourne Mining Equipment Innovation', 9, 13);

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