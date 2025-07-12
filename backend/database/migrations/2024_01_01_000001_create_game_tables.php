<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Configurations table for game settings
        Schema::create('configurations', function (Blueprint $table) {
            $table->string('name')->primary();
            $table->text('value');
        });

        // Commodities table for tradeable goods
        Schema::create('commodities', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->string('icon')->nullable();
            $table->decimal('base_price', 10, 2)->default(0.00);
            $table->timestamps();
        });

        // Cities table for game locations
        Schema::create('cities', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->foreignId('primary_export')->nullable()->constrained('commodities')->onDelete('set null');
            $table->foreignId('primary_import')->nullable()->constrained('commodities')->onDelete('set null');
            $table->timestamps();
        });

        // Traders table for NPC traders in cities
        Schema::create('traders', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('icon')->nullable();
            $table->foreignId('city_id')->constrained()->onDelete('cascade');
            $table->timestamps();
        });

        // Event types table for different types of events
        Schema::create('event_types', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->text('consequence');
            $table->timestamps();
        });

        // Events table for game events
        Schema::create('events', function (Blueprint $table) {
            $table->id();
            $table->string('headline');
            $table->foreignId('event_type_id')->constrained()->onDelete('cascade');
            $table->foreignId('city_id')->nullable()->constrained()->onDelete('cascade');
            $table->timestamps();
        });

        // City distances table for travel costs
        Schema::create('city_distances', function (Blueprint $table) {
            $table->id();
            $table->foreignId('from_city_id')->constrained('cities')->onDelete('cascade');
            $table->foreignId('to_city_id')->constrained('cities')->onDelete('cascade');
            $table->decimal('distance_km', 8, 2);
            $table->unique(['from_city_id', 'to_city_id']);
            $table->timestamps();
        });

        // Player sprites table for character selection
        Schema::create('player_sprites', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->string('filename')->unique();
            $table->text('description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('city_distances');
        Schema::dropIfExists('events');
        Schema::dropIfExists('event_types');
        Schema::dropIfExists('traders');
        Schema::dropIfExists('cities');
        Schema::dropIfExists('commodities');
        Schema::dropIfExists('configurations');
        Schema::dropIfExists('player_sprites');
    }
}; 