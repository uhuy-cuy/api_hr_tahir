<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jabatan extends Model
{
    use HasFactory;

    protected $primaryKey = 'id_jabatan';
    public $timestamps = false; // Hanya created_at sudah ada

    protected $fillable = [
        'nama_jabatan',
        'created_at',
    ];

    /**
     * Relasi ke Karyawan
     * Satu jabatan bisa dimiliki banyak karyawan
     */
    public function karyawans()
    {
        return $this->hasMany(Karyawan::class, 'id_jabatan', 'id_jabatan');
    }
}