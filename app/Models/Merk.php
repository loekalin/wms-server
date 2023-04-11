<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Merk extends Model
{
    use HasFactory;
    
    protected $guarded = ['id','Merk_uuid']; 
    public $timestamps = false;

    public function products() {
        return $this->hasMany(Product::class);
    }
}
