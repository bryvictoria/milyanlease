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
        Schema::create('units', function (Blueprint $table) {
            $table->id();
			$table->foreignId('building_id')->constrained();
            $table->foreignId('owner_user_id')->constrained(table: 'users', indexName: 'owners_user_id');
            $table->string('name');
            $table->string('code');
            $table->string('description')->nullable();
            $table->tinyInteger('status')->comment('available, occupied, cancelled, pending, deleted'); 
            $table->tinyInteger('type')->comment('studio, 1br, 2br'); 
            $table->tinyInteger('furnished')->comment('bare, semi, fully'); 
            $table->boolean('enabled')->nullable();
            $table->boolean('allow_pets')->nullable();
            $table->tinyInteger('allowed_occupants')->nullable();
            $table->boolean('is_loft')->nullable();
            $table->boolean('is_penthouse')->nullable();
            $table->double('sqm')->nullable();
            $table->string('floor')->nullable();
            $table->timestamps();
			$table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('units');
    }
};
