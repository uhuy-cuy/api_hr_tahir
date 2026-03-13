<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cuti extends Model
{
    use HasFactory;

    protected $primaryKey = 'id_cuti';
    public $timestamps = false; // created_at & approved_at manual

    protected $fillable = [
        'id_karyawan',
        'tanggal_mulai',
        'tanggal_selesai',
        'jenis_cuti',
        'alasan',
        'status',
        'created_at',
        'approved_at',
        'approved_by',
    ];

    /**
     * Relasi ke Karyawan
     */
    public function karyawan()
    {
        return $this->belongsTo(Karyawan::class, 'id_karyawan', 'id_karyawan');
    }

    /**
     * Relasi ke User (HR yang approve)
     */
    public function approvedBy()
    {
        return $this->belongsTo(User::class, 'approved_by', 'id_karyawan');
    }
}