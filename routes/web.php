<?php

use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\Admin\UnitController;
use App\Http\Controllers\Admin\AdsController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MessageController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
/*
Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});
*/
Route::get('/', [HomeController::class, 'index'])->name('home');
Route::post('/message/save', [MessageController::class, 'save'])->name('message.save');
Route::get('/ads', [HomeController::class, 'ads'])->name('ads');

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
	
    Route::get('/dashboard', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');
	
	Route::get('/admin/units', [UnitController::class, 'list'])->name('admin.units');
	Route::post('/admin/units/add_photo/{unitid}', [UnitController::class, 'add_photo'])->name('admin.units.add_photo');
	Route::post('/admin/units/remove_photo', [UnitController::class, 'remove_photo'])->name('admin.units.remove_photo');
	Route::post('/admin/units/save', [UnitController::class, 'save'])->name('admin.units.save');
	Route::post('/admin/units/set_primary_image', [UnitController::class, 'set_primary_image'])->name('admin.units.set_primary_image');
	
	Route::post('/admin/ads/save', [AdsController::class, 'save'])->name('admin.ads.save');
	
});
