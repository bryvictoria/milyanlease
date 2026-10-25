<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UnitPhoto extends Model
{
    use HasFactory;
	
	protected $fillable = ['enabled', 'unit_id', 'filename', 'thumbnail','path','main'];
	
	protected $maps = [
	  'path' => 'url',
	];
	
	protected $append = [
	  'url'
	];
	
	public function getUrlAttribute() {
	  return $this->attributes['path'];
	}
}
