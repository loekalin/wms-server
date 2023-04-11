<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $guarded = ['id','uuid'];

    public function category()  {
        return $this->belongsTo(Category::class);
    }

    public function merk() {
        return $this->belongsTo(Merk::class);
    }

    public function satuan() {
        return $this->belongsTo(Satuan::class);
    }

    public function subCategory()
    {
        return $this->belongsTo(SubCategory::class);
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }
}
