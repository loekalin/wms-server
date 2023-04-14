<?php

use App\Models\User;
use App\Models\Stock;
use App\Models\Product;
use App\Models\Receiving;
use App\Enums\UserRoleEnum;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/home', function () {
    return view('home', [
        'user' => User::first()->role->value,
         //UserRoleEnum::cases() ,
        'data' => Stock::all(),
        'recs' => Receiving::join('receiving_details', 'receivings.id', '=' , 'receiving_details.receiving_id')
                            ->join('products', 'products.id', '=' , 'receiving_details.product_id')
                            ->get(['receivings.receiving_uuid', 'receivings.receiving_date' , 'receiving_details.receivingdetail_uuid' , 'products.product_name']),
        'joins' => Product::join('categories','products.category_id','=', 'categories.id')
                        ->get(['products.Product_name' , 'categories.Category_name'])
    ]);
});
