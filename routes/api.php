<?php

use App\Models\Product;
use App\Models\SubCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\IssuingController;
use App\Http\Controllers\Api\MasterController;
use App\Http\Controllers\Api\MasterUserController;
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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::controller(AuthController::class)->group(function () {
    Route::post('/login', 'login')->name('login');
    // Route::post('/logout', 'logout');
})->middleware('guest');

Route::controller(ApiReceivesController::class)->group(function () {
    Route::get('/receivings', 'index');
    Route::get('/receivings/{receiving:receiving_uuid}', 'show');
    Route::get('/receiving/create', 'create');
    Route::post('/receivings', 'store');
    Route::get('/receivings/{receiving:receiving_uuid}/edit', 'edit');
    Route::patch('/receivings/{receiving:receiving_uuid}', 'update');
    Route::delete('/receivings/{receiving:receiving_uuid}', 'destroy');
})->middleware('auth:api');

Route::controller(IssuingController::class)->group(function () {
    Route::get('/issuings', 'index');
    Route::get('/issuings/{issuing:issuing_uuid}', 'show');
    Route::get('/issuing/create', 'create');
    Route::post('/issuings', 'store');
    Route::get('/issuings/{issuing:issuing_uuid}/edit', 'edit');
    Route::patch('/issuings/{issuing:issuing_uuid}', 'update');
    Route::delete('/issuings/{issuing:issuing_uuid}', 'destroy');
})->middleware('auth:api');

Route::controller(MasterController::class)->group(function () {
    Route::post('/master','store');
})->middleware('auth:api');

Route::controller(MasterUserController::class)->group(function () {
    Route::get('/users' , 'index');
    Route::post('/user','store');
})->middleware('auth:api');