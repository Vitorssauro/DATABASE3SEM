<?php

use App\Http\Controllers\ProdutoController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('home');
});

Route::get('/registro', [UserController::class, 'showRegistroForm'])->
name('usuarios.registro');

Route::post('/registro', [UserController::class, 'registro'])->
name('usuarios.controller');

//login
Route::get('/login', [UserController::class, 'showLoginForm'])->
name('usuarios.login');

Route::post('/login', [UserController::class, 'login'])->
name('usuarios.controller');

// Rota para a pagina interna
Route::get('/dashboard',function(){
    return view('usuarios.dashboard');
})->middleware('auth')->name('usarios.dashboard');

//Rota do Logout
Route::post('/logout', [UserController::class,'logout'])->
name('usuarios.logout');;

// Rota para produtos
Route::resource('produtos', ProdutoController::class);

Route::resource('produtos')