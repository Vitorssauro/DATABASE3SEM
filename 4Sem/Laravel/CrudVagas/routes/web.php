<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\VagasController;

Route::get('/', function () {
    return view('welcome');
});

Route::resource('vagas', VagasController::class);