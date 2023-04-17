<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Receiving extends Model
{
    use HasFactory;

    protected $guarded = ['id', 'uuid'];


    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function receivingdetail()
    {
        return $this->hasOne(ReceivingDetail::class);
    }
}
