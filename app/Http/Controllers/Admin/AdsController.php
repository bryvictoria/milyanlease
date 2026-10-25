<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Unit;
use App\Models\Advertisement;
class AdsController extends Controller
{
    function save(Request $request){
		$result = false;
		
		$data = $request->all();
		
		if(isset($data['id']) && strlen($data['id'])){
			$ads = Advertisement::findOrFail($data['id']);
		} else{
			$ads = new Advertisement();
			$ads->status = 1;
			
		}
		$ads->fill($data);
		
		$ads->enabled = 1;
		
		if($ads->save()){
			$result = true;
		}
		
		return compact('result','ads');
	}
}
