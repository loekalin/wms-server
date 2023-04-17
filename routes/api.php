<?php

use App\Models\Product;
use App\Models\SubCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\IssuingController;
use App\Http\Controllers\Api\ReceivesController as ApiReceivesController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::controller(AuthController::class)->group(function () {
    Route::post('/login' , 'login')->name('login');
    // Route::post('/logout', 'logout');
})->middleware('guest');

Route::controller(ApiReceivesController::class)->group(function () {
    Route::get('/receivings' , 'index');
    Route::get('/receivings/{receiving:receiving_uuid}', 'show');
    Route::get('/receiving/create', 'create');
    Route::post('/receivings', 'store');
    Route::get('/receivings/{receiving:receiving_uuid}/edit' , 'edit');
})->middleware('auth:api');

Route::controller(IssuingController::class)->group(function () {
    Route::get('/issuings' , 'index');
    Route::get('/issuings/{issuing:issuing_uuid}', 'show');
    Route::get('/issuing/create', 'create');
    Route::post('/issuings', 'store');
})->middleware('auth:api');

Route::post('/sub_categories' ,function (Request $request) {
    $data = $request->validate([
        'subcategory_uuid' => fake()->uuid(),
        'subcategory_name' => 'required|unique:sub_categories,subcategory_name',
    ]);

    $sub_categories = SubCategory::create($data);
    return response()->json($sub_categories,200);
});