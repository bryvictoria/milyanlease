<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Advertisement extends Model
{
    use HasFactory;
	
	protected $fillable = [
		'unit_id',
		'offer_type',
		'title',
		'ad_content',
		'status',
		'enabled',
		'advance_payment',
		'price',
		'is_featured',
		'min_tenure',
		'monthly_rate',
		'deposit_security',
		'deposit_utility'
	];
	
	public function unit()
    {
        return $this->belongsTo(Unit::class);
    }
}
