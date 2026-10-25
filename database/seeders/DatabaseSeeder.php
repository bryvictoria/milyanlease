<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
			TRCSeeder::class,
		]);

        User::factory()->withPersonalTeam()->create([
            'name' => 'Administrator',
            'email' => 'administrator@app.com',
            'password' => Hash::make('password'),
        ]);

        $this->call([
            UnitSeeder::class,
            DemoAdvertisementSeeder::class,
        ]);
    }
}
