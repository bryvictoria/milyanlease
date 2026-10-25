<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Unit;
use App\Models\Advertisement;
use Inertia\Inertia;
class HomeController extends Controller
{
    function index(){
		$advertisements = Advertisement::where('enabled',1)
			->where('is_featured',1)
			->with('unit')
			->with('unit.mainPhoto')
			->with(['unit.photos' => function($q) {
				$q->where('enabled', 1);
			}])
			->take(8)
			->get();
		
		return Inertia::render('Welcome', [
          'featuredUnits' => $advertisements,
		]);
	}
	
	function ads(){
		$advertisements = Advertisement::where('enabled',1)
			->with('unit')
			->with('unit.mainPhoto')
			->with(['unit.photos' => function($q) {
				$q->where('enabled', 1);
			}])
			->get();
		$types = Unit::TYPES;
		$furnishtypes = Unit::FURNISH_TYPES;
		return Inertia::render('Ads', [
          'advertisements' => $advertisements,
		  'types' => $types,
		  'furnishtypes' => $furnishtypes,
		]);
	}
}
