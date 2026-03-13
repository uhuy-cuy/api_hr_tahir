<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('cutis', function (Blueprint $table) {
            $table->id('id_cuti'); // Primary key
            $table->unsignedBigInteger('id_karyawan'); // FK ke karyawans
            $table->date('tanggal_mulai');
            $table->date('tanggal_selesai');
            $table->enum('jenis_cuti', ['tahunan', 'sakit', 'khusus'])->default('tahunan');
            $table->text('alasan')->nullable();
            $table->enum('status', ['pending', 'disetujui', 'ditolak'])->default('pending');
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('approved_at')->nullable();
            $table->unsignedBigInteger('approved_by')->nullable(); // FK ke users (HR)

            // Foreign keys
            // $table->foreign('id_karyawan')->references('id_karyawan')->on('karyawans')->onDelete('cascade');
            // $table->foreign('approved_by')->references('id_user')->on('users')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('cutis');
    }
};