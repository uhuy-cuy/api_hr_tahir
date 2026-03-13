<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Karyawan extends Model
{
    use HasFactory;

    protected $primaryKey = 'id_karyawan';
    public $timestamps = true; // created_at & updated_at

    protected $fillable = [
        'nama',
        'nik',
        'email',
        'phone',
        'id_jabatan',
        'id_departemen',
        'status',
    ];

    /**
     * Relasi ke tabel Jabatan
     */
    public function jabatan()
    {
        return $this->belongsTo(Jabatan::class, 'id_jabatan', 'id_jabatan');
    }

    /**
     * Relasi ke tabel Departemen
     */
    public function departemen()
    {
        return $this->belongsTo(Departemen::class, 'id_departemen', 'id_departemen');
    }
}