<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\{
    UserController,
    KaryawanController,
    JabatanController,
    DepartemenController,
    AbsensiController,
    CutiController
};

// ----------------------------
// REGISTER & LOGIN (PUBLIC)
// ----------------------------
// PUBLIC ROUTES
Route::post('register', [UserController::class, 'register']);
Route::post('login', [UserController::class, 'login']);

// ----------------------------
// PROTECTED ROUTES (AUTH)
// ----------------------------
Route::get('users', [UserController::class, 'index']);
Route::get('users/{id}', [UserController::class, 'show']);
Route::post('users', [UserController::class, 'register']); // Bisa pakai register untuk test create
Route::put('users/{id}', [UserController::class, 'update']);
Route::delete('users/{id}', [UserController::class, 'destroy']);

Route::middleware('auth:web')->group(function () {

    // Logout
    Route::post('logout', [UserController::class, 'logout']);

    // ----------------------------
    // CRUD USER (admin only)
    // ----------------------------
    // Route::get('users', [UserController::class, 'index']);
    // Route::get('users/{id}', [UserController::class, 'show']);
    // Route::put('users/{id}', [UserController::class, 'update']);
    // Route::delete('users/{id}', [UserController::class, 'destroy']);

    // ----------------------------
    // CRUD KARYAWAN
    // ----------------------------
    Route::get('karyawans', [KaryawanController::class, 'index']);
    Route::get('karyawans/{id}', [KaryawanController::class, 'show']);
    Route::post('karyawans', [KaryawanController::class, 'store']);
    Route::put('karyawans/{id}', [KaryawanController::class, 'update']);
    Route::delete('karyawans/{id}', [KaryawanController::class, 'destroy']);

    // ----------------------------
    // CRUD JABATAN
    // ----------------------------
    Route::get('jabatans', [JabatanController::class, 'index']);
    Route::get('jabatans/{id}', [JabatanController::class, 'show']);
    Route::post('jabatans', [JabatanController::class, 'store']);
    Route::put('jabatans/{id}', [JabatanController::class, 'update']);
    Route::delete('jabatans/{id}', [JabatanController::class, 'destroy']);

    // ----------------------------
    // CRUD DEPARTEMEN
    // ----------------------------
    Route::get('departemens', [DepartemenController::class, 'index']);
    Route::get('departemens/{id}', [DepartemenController::class, 'show']);
    Route::post('departemens', [DepartemenController::class, 'store']);
    Route::put('departemens/{id}', [DepartemenController::class, 'update']);
    Route::delete('departemens/{id}', [DepartemenController::class, 'destroy']);

    // ----------------------------
    // CRUD ABSENSI
    // ----------------------------
    Route::get('absensis', [AbsensiController::class, 'index']);
    Route::get('absensis/{id}', [AbsensiController::class, 'show']);
    Route::post('absensis', [AbsensiController::class, 'store']);
    Route::put('absensis/{id}', [AbsensiController::class, 'update']);
    Route::delete('absensis/{id}', [AbsensiController::class, 'destroy']);

    // ----------------------------
    // CRUD CUTI
    // ----------------------------
    Route::get('cutis', [CutiController::class, 'index']);
    Route::get('cutis/{id}', [CutiController::class, 'show']);
    Route::post('cutis', [CutiController::class, 'store']);
    Route::put('cutis/{id}', [CutiController::class, 'update']);
    Route::delete('cutis/{id}', [CutiController::class, 'destroy']);
});