<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function products()
    {
        $product = Product::join('stocks as s','products.id', '=', 's.product_id')
        ->select('products.product_name as name', 's.stock_value as value')
        ->get();
        return response()->json($product,200);
    }
}
