<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Satuan extends Model
{
    use HasFactory;

    public $timestamps = false;
    protected $guarded = ['id', 'Satuan_uuid'];

    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
