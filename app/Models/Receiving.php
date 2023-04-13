<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Receiving extends Model
{
    use HasFactory;

    protected $guarded = ['id'];


    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function receivingDetail()
    {
        return $this->hasOne(ReceivingDetail::class);
    }
}
