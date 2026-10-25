<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    use HasFactory;
	
	const STATUS_AVAILABLE = 1;
	const STATUS_OCCUPIED = 2;
	const STATUS_PENDING = 3;
	const STATUS_CANCELLED = 4;
	const STATUS_DELETED = 5;
	
	const STATUSES = [
		self::STATUS_AVAILABLE => 'Available',
		self::STATUS_OCCUPIED => 'Occupied',
		self::STATUS_PENDING => 'Pending',
		self::STATUS_CANCELLED => 'Cancelled',
		self::STATUS_DELETED => 'Deleted'
	];
	const STATUS_COLORS = [
		self::STATUS_AVAILABLE => 'success',
		self::STATUS_OCCUPIED => 'primary',
		self::STATUS_PENDING => 'warning',
		self::STATUS_CANCELLED => 'warning',
		self::STATUS_DELETED => 'danger'
	];
	
	const TYPE_STUDIO = 1;
	const TYPE_OBR = 2;
	const TYPE_TBR = 3;
	
	const TYPES = [
		self::TYPE_STUDIO => 'Studio',
		self::TYPE_OBR => '1 Bedroom',
		self::TYPE_TBR => '2 Bedroom'
	];
	
	const FURNISH_BARE = 1;
	const FURNISH_SEMI = 2;
	const FURNISH_FULL = 3;
	
	const FURNISH_TYPES = [
		self::FURNISH_BARE => 'Bare',
		self::FURNISH_SEMI => 'Semi-Furnished',
		self::FURNISH_FULL => 'Fully-Furnished'
	];
	
	protected $appends = ['summary'];
	protected $fillable = ['building_id',
		'owner_user_id',
		'name',
		'code',
		'description',
		'status',
		'type',
		'furnished',
		'enabled',
		'allow_pets',
		'allowed_occupants',
		'is_loft',
		'is_penthouse',
		'sqm',
		'floor'
	];
	
	public function photos()
    {
        return $this->hasMany(UnitPhoto::class);
    }
	
	public function advertisement()
    {
        return $this->hasOne(Advertisement::class)->ofMany([
			'id' => 'max',
		], function ($query) {
			$query->where('enabled', 1);
			$query->where('status','<>', 3);
		});
    }
	
	public function mainPhoto()
    {
        return $this->hasOne(UnitPhoto::class)
            ->where('enabled', 1)
            ->orderByDesc('main')
            ->orderBy('id')
            ->withDefault([
                'path' => '/assets/img/cover.jpg',
                'thumbnail' => '/assets/img/cover.jpg',
            ]);
    }
	
	public function _shortSummary(){
		$details = [];
		
		if($this->allow_pets){
			$details[] = "Pets Friendly";
		}
		
		if($this->is_loft){
			$details[] = "Loft Type";
		}
		
		if($this->is_penthouse){
			$details[] = "Penthouse";
		}
		
		return $details;
	}
	
	public function getSummaryAttribute(){
		$details = [];
		
		if($this->type && isset(self::TYPES[$this->type])){
			$details[] = self::TYPES[$this->type];
		}
		
		if($this->furnished && isset(self::FURNISH_TYPES[$this->furnished])){
			$details[] = self::FURNISH_TYPES[$this->furnished];
		}
		
		$details = array_merge($details,$this->_shortSummary());
		
		
		return $details;
		
	}
	
	public function getShortSummaryAttribute(){
		
		return $this->_shortSummary();
		
	}
}
