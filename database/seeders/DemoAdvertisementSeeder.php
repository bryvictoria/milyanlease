<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DemoAdvertisementSeeder extends Seeder
{
    public function run(): void
    {
        $now = now();

        foreach (DB::table('units')->whereNull('deleted_at')->get() as $unit) {
            DB::table('advertisements')->updateOrInsert(
                ['unit_id' => $unit->id],
                [
                    'offer_type' => 1,
                    'title' => $unit->name,
                    'ad_content' => 'Contact MiLYANLEASE for current rental rates and viewing availability.',
                    'status' => 1,
                    'enabled' => 1,
                    'is_featured' => 1,
                    'advance_payment' => 1,
                    'price' => null,
                    'min_tenure' => null,
                    'monthly_rate' => null,
                    'deposit_security' => null,
                    'deposit_utility' => null,
                    'created_at' => $now,
                    'updated_at' => $now,
                    'deleted_at' => null,
                ]
            );
        }
    }
}
