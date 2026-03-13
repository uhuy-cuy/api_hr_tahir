<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Departemen extends Model
{
    use HasFactory;

    protected $primaryKey = 'id_departemen';
    public $timestamps = false; // hanya created_at

    protected $fillable = [
        'nama_departemen',
        'created_at',
    ];

    /**
     * Relasi ke Karyawan
     * Satu departemen bisa dimiliki banyak karyawan
     */
    public function karyawans()
    {
        return $this->hasMany(Karyawan::class, 'id_departemen', 'id_departemen');
    }
}