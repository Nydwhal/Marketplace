<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;


Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::get('/user-profile', [AuthController::class, 'userProfile']);
});

Route::group([
    'middleware' => 'api',
    'prefix' => 'product'
], function ($router) {
    Route::get('/products', [ProductController::class, 'index']);
    Route::post('/add', [ProductController::class, 'addProduct']);
    Route::post('/edit', [ProductController::class, 'editProduct']);
    Route::post('/bid', [ProductController::class, 'bidProduct']);
    Route::post('/delete', [ProductController::class, 'deleteProduct']);
});

Route::group([
    'middleware' => 'api',
    'prefix' => 'admin'
], function ($router) {
    Route::get('/users', [UserController::class, 'getAllUsers']);
    Route::get('/user', [UserController::class, 'getUserById']);
    Route::post('/user/edit', [UserController::class, 'editUser']);
    Route::delete('/user/delete', [UserController::class, 'deleteUser']);
    Route::post('/edit', [UserController::class, 'edit']);
    Route::post('/productSold', [ProductController::class, 'productSold']);
    Route::get('/check-admin', [AuthController::class, 'checkAdmin']);
});

//Changer mettre
//Changer amount
//changer product_state (en vente/vendu)