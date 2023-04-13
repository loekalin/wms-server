<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function receiving()
    {
        return $this->hasMany(Receiving::class);
    }
    
    public function issuing()
    {
        return $this->hasMany(Issuing::class);
    }
}
