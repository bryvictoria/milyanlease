<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

use App\Models\Property;
use App\Models\Building;

class TRCSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
		$property = Property::firstOrCreate([
            'name' => 'The Residence @ Commonwealth',
            'code' => 'TRC',
            'description' => 'trc',
            'type' => 1,
            'enabled' => 1,
        ]);
		
		$buildings = [
			"QN" => "Quezon North",
			"QS" => "Quezon South",
			"OE" => "Osmena East",
			"RE" => "Roxas East",
			"QE" => "Quirino East",
			"OW" => "Osmena West",
			"RW" => "Roxas West",
			"QW" => "Quirino West",
		];
		foreach($buildings as $buildingcode => $building){
			Building::firstOrCreate([
				'property_id' => $property->id,
				'name' => $building,
				'description' => $building,
				'code' => $buildingcode,
				'enabled' => 1,
			]);
		}
    }
}
