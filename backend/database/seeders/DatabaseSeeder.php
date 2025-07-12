<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Seed configurations
        $this->seedConfigurations();
        
        // Seed commodities
        $this->seedCommodities();
        
        // Seed cities
        $this->seedCities();
        
        // Seed traders
        $this->seedTraders();
        
        // Seed event types
        $this->seedEventTypes();
        
        // Seed player sprites
        $this->seedPlayerSprites();
    }
    
    private function seedConfigurations(): void
    {
        $configurations = [
            ['name' => 'game_name', 'value' => 'Trade Wars'],
            ['name' => 'starting_cash', 'value' => '10000'],
            ['name' => 'max_cargo', 'value' => '100'],
            ['name' => 'fuel_cost_per_km', 'value' => '0.5'],
        ];
        
        foreach ($configurations as $config) {
            DB::table('configurations')->insertOrIgnore($config);
        }
    }
    
    private function seedCommodities(): void
    {
        $commodities = [
            ['name' => 'Food', 'icon' => 'food.png', 'base_price' => 10.00],
            ['name' => 'Medicine', 'icon' => 'medicine.png', 'base_price' => 50.00],
            ['name' => 'Electronics', 'icon' => 'electronics.png', 'base_price' => 100.00],
            ['name' => 'Fuel', 'icon' => 'fuel.png', 'base_price' => 25.00],
            ['name' => 'Ore', 'icon' => 'ore.png', 'base_price' => 15.00],
            ['name' => 'Luxury Goods', 'icon' => 'luxury.png', 'base_price' => 200.00],
        ];
        
        foreach ($commodities as $commodity) {
            DB::table('commodities')->insertOrIgnore($commodity);
        }
    }
    
    private function seedCities(): void
    {
        $cities = [
            ['name' => 'New York', 'primary_export' => 3, 'primary_import' => 1], // Electronics, Food
            ['name' => 'Los Angeles', 'primary_export' => 3, 'primary_import' => 4], // Electronics, Fuel
            ['name' => 'Chicago', 'primary_export' => 1, 'primary_import' => 5], // Food, Ore
            ['name' => 'Houston', 'primary_export' => 4, 'primary_import' => 3], // Fuel, Electronics
            ['name' => 'Miami', 'primary_export' => 6, 'primary_import' => 2], // Luxury Goods, Medicine
        ];
        
        foreach ($cities as $city) {
            DB::table('cities')->insertOrIgnore($city);
        }
    }
    
    private function seedTraders(): void
    {
        $traders = [
            ['name' => 'John Smith', 'icon' => 'trader1.png', 'city_id' => 1],
            ['name' => 'Maria Garcia', 'icon' => 'trader2.png', 'city_id' => 2],
            ['name' => 'David Johnson', 'icon' => 'trader3.png', 'city_id' => 3],
            ['name' => 'Sarah Wilson', 'icon' => 'trader4.png', 'city_id' => 4],
            ['name' => 'Michael Brown', 'icon' => 'trader5.png', 'city_id' => 5],
        ];
        
        foreach ($traders as $trader) {
            DB::table('traders')->insertOrIgnore($trader);
        }
    }
    
    private function seedEventTypes(): void
    {
        $eventTypes = [
            ['name' => 'Market Crash', 'consequence' => 'All commodity prices drop by 20%'],
            ['name' => 'Supply Shortage', 'consequence' => 'Food and Medicine prices increase by 30%'],
            ['name' => 'Fuel Crisis', 'consequence' => 'Fuel prices double, travel costs increase'],
            ['name' => 'Economic Boom', 'consequence' => 'All commodity prices increase by 15%'],
            ['name' => 'Pirate Activity', 'consequence' => 'Travel between cities becomes more dangerous'],
        ];
        
        foreach ($eventTypes as $eventType) {
            DB::table('event_types')->insertOrIgnore($eventType);
        }
    }
    
    private function seedPlayerSprites(): void
    {
        $sprites = [
            ['name' => 'Pilot', 'filename' => 'pilot.png', 'description' => 'A skilled space pilot'],
            ['name' => 'Merchant', 'filename' => 'merchant.png', 'description' => 'A wealthy trader'],
            ['name' => 'Explorer', 'filename' => 'explorer.png', 'description' => 'An adventurous explorer'],
            ['name' => 'Smuggler', 'filename' => 'smuggler.png', 'description' => 'A cunning smuggler'],
        ];
        
        foreach ($sprites as $sprite) {
            DB::table('player_sprites')->insertOrIgnore($sprite);
        }
    }
} 