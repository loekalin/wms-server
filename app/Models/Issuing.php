<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Issuing extends Model
{
    use HasFactory;
    protected $guarded = ['id', 'uuid'];


    public function user()
    {
        return $this->belongsTo(user::class);
    }

    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    public function issuingdetail()
    {
        return $this->hasOne(IssuingDetail::class);
    }
}
