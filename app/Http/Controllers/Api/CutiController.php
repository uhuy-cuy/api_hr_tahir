<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cuti;

class CutiController extends Controller
{
    // LIST SEMUA CUTI
    public function index()
    {
        return response()->json(Cuti::with(['karyawan', 'approvedBy'])->get());
    }

    // BUAT CUTI
    public function store(Request $request)
    {
        $validated = $request->validate([
            'id_karyawan' => 'required|exists:karyawans,id_karyawan',
            'tanggal_mulai' => 'required|date',
            'tanggal_selesai' => 'required|date|after_or_equal:tanggal_mulai',
            'jenis_cuti' => 'required|in:tahunan,sakit,khusus',
            'alasan' => 'nullable|string',
        ]);

        $cuti = Cuti::create($validated);

        return response()->json($cuti, 201);
    }

    // DETAIL CUTI
    // public function show($id)
    // {
    //     return response()->json(Cuti::with(['karyawan', 'approvedBy'])->findOrFail($id));
    // }
    public function show($id_karyawan)
    {
        // Ambil cuti untuk karyawan tertentu
        $cutis = Cuti::where('id_karyawan', $id_karyawan)->get();

        return response()->json($cutis);
    }


    // UPDATE CUTI (misal persetujuan HR)
    public function update(Request $request, $id)
    {
        $cuti = Cuti::findOrFail($id);

        $validated = $request->validate([
            'status' => 'nullable|in:pending,disetujui,ditolak',
            'approved_by' => 'nullable|exists:users,id_karyawan',
            'approved_at' => 'nullable|date',
            'tanggal_mulai' => 'nullable|date',
            'tanggal_selesai' => 'nullable|date|after_or_equal:tanggal_mulai',
            'jenis_cuti' => 'nullable|in:tahunan,sakit,khusus',
            'alasan' => 'nullable|string',
        ]);

        $cuti->update($validated);

        return response()->json($cuti);
    }

    // HAPUS CUTI
    public function destroy($id)
    {
        $cuti = Cuti::findOrFail($id);
        $cuti->delete();

        return response()->json(['message' => 'Cuti deleted']);
    }
}