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
        Schema::create('advertisements', function (Blueprint $table) {
            $table->id();
            $table->foreignId('unit_id')->constrained();
			$table->integer('offer_type')->comment('1 - rent,2 - sale')->default(1);
			$table->string('title');
			$table->string('ad_content')->nullable();
			$table->integer('status')->nullable()->comment('published,pending,closed');
			$table->boolean('enabled')->nullable();
			$table->boolean('advance_payment')->default(1);
			$table->double('price')->nullable();
			$table->integer('min_tenure')->nullable();
			$table->double('monthly_rate')->nullable();
			$table->double('deposit_security')->comment('monthly')->nullable();
			$table->double('deposit_utility')->nullable();
			$table->timestamps();
        	$table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('advertisements');
    }
};
