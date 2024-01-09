<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\RealstateController;
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
Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
 
Route::get('failed', [AuthController::class, 'failed']);

Route::middleware(['auth:api' ])->group(function () {

Route::prefix('/users')->group(function () {
    Route::post('/view', [UserController::class, 'index']);
    Route::post('/getLoginUser', [UserController::class, 'getLoginUser']); 
    Route::post('/getUserByName', [UserController::class, 'getUserByName']);
    Route::post('/saveImage', [UserController::class, 'storeImage']); 
});

Route::prefix('/realstate')->group(function () {
    Route::post('/show', [RealstateController::class, 'getAllStates']);
    Route::post('/iteminfo', [RealstateController::class, 'getStatesbyId']); 
    Route::post('/saveImage', [RealstateController::class, 'storeImage']);
     
});

});
/*
Route::group([

    'middleware' => 'api',
    'prefix' => 'auth'

], function ($router) {

    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');

});
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
*/