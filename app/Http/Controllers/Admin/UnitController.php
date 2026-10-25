<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Unit;
use App\Models\UnitPhoto;
use App\Models\Building;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class UnitController extends Controller
{
    function list(){
		$filter = request()->all();
		
		$query = Unit::query();
		$query->where('enabled',true)
			->with(["photos" => function($q){
				$q->where('enabled', '=', 1);
				$q->select(['id','name','path','unit_id',DB::raw('path as url')]);
			}]);
			
		if(isset($filter['building_id']) && strlen($filter['building_id'])){
			$query->where('building_id',$filter['building_id']);
		}
		if(isset($filter['type']) && strlen($filter['type'])){
			$query->where('type',$filter['type']);
		}
		if(isset($filter['furnished']) && strlen($filter['furnished'])){
			$query->where('furnished',$filter['furnished']);
		}
		$query->with('advertisement');	
		$units =  $query->paginate(10)->withQueryString();
			
		//foreach($units as $unit)
		//	foreach($unit->photos as $photo)
		//		$photo->url = $photo->path;
		
		$buildings = Building::where('enabled',true)
			->get()
			->pluck('name','id');
		$statuses = Unit::STATUSES;
		$statuscolors = Unit::STATUS_COLORS;
		$types = Unit::TYPES;
		$furnishtypes = Unit::FURNISH_TYPES;
		
		return Inertia::render('Admin/Unit/List', [
          'units' => $units,
		  'statuses' => $statuses,
		  'statuscolors' => $statuscolors,
		  'types' => $types,
		  'buildings' => $buildings,
		  'furnishtypes' => $furnishtypes,
		  'filter' => $filter
        ]);
	}
	
	function add_photo(Request $request, $unitid){
		$result = false;
		
		$image = $request->file('file');
		$fileName = 'UP'.time() . '.' . $image->getClientOriginalExtension();
 		$path = $image->storeAs('public/photos/units', $fileName);
		$path = str_replace('public','storage',$path);
		$path = '/'.$path;

		$hasMain = UnitPhoto::where('unit_id', $unitid)->where('main', 1)->where('enabled', 1)->exists();

		$unitphoto = UnitPhoto::create([
			'unit_id' => $unitid,
			'filename' => $fileName,
			'thumbnail' => $path,
			'path' => $path,
			'enabled' => true,
			'main' => $hasMain ? 0 : 1
		]);
		
		return compact('result','unitphoto','unitid');
		
	}
	function set_primary_image(Request $request){
		$result = false;
		
		$data = $request->all();
		if(isset($data['id']) && strlen($data['id'])){
			$unitphoto = UnitPhoto::findOrFail($data['id']);
			
			UnitPhoto::where('unit_id', $unitphoto->unit_id)->update(['main' => 0]);
			
			$unitphoto->main = 1;
			if($unitphoto->save()){
				$result = true;
			}
		}
		
		return compact('result','unitphoto');
	}
	
	function save(Request $request){
		$result = false;
		
		$data = $request->all();
		if(isset($data['id']) && strlen($data['id'])){
			$unit = Unit::findOrFail($data['id']);
		} else{
			$unit = new Unit();
			$unit->status = Unit::STATUS_PENDING;
			$unit->owner_user_id = 1;
			
		}
		$unit->fill($data);
		
		$unit->enabled = 1;
		
		if($unit->save()){
			$result = true;
		}
		
		return compact('result','unit');
		
	}
	
	function remove_photo(Request $request){
		$result = false;
		
		$id = $request->id;
		if($id){
			$unitphoto = UnitPhoto::find($id);
			if($unitphoto){
				$unitphoto->enabled = 0;
				if($unitphoto->save()){
					$result = true;
				}
			}
		}
		return compact('result');
		
	}
}
