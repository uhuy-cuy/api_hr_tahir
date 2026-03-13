<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('absensis', function (Blueprint $table) {
            $table->id('id_absensi'); // Primary key
            $table->unsignedBigInteger('id_karyawan'); // FK ke karyawans
            $table->date('tanggal'); // tanggal absensi
            $table->time('jam_masuk')->nullable();
            $table->time('jam_keluar')->nullable();
            $table->enum('status', ['hadir','izin','sakit','alpha'])->default('hadir');
            $table->timestamp('created_at')->useCurrent();

            // Foreign key
            $table->foreign('id_karyawan')->references('id_karyawan')->on('karyawans')->onDelete('cascade');

            // Unique: 1 record per karyawan per tanggal
            $table->unique(['id_karyawan','tanggal']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('absensis');
    }
};