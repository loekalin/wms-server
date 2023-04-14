<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IssuingDetail extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public $timestamps = false;

    public function issuing()
    {
        return $this->belongsTo(Issuing::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
