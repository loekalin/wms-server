<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReceivingDetail extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public $timestamps = false;

    public function receiving()
    {
        return $this->belongsTo(Receiving::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
