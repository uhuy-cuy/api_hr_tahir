<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Absensi;

class AbsensiController extends Controller
{
    // LIST SEMUA ABSENSI
    public function index()
    {
        return response()->json(Absensi::with('karyawan')->get());
    }
    public function absensiUser($id_karyawan)
    {
        $hariIni = Absensi::where('id_karyawan', $id_karyawan)
            ->whereDate('tanggal', now()->toDateString())
            ->first();

        $riwayat = Absensi::where('id_karyawan', $id_karyawan)
            ->whereMonth('tanggal', now()->month)
            ->orderBy('tanggal', 'desc')
            ->get();

        return response()->json([
            'hariIni' => $hariIni,
            'riwayat' => $riwayat
        ]);
    }

    // BUAT ABSENSI
    public function store(Request $request)
    {
        $validated = $request->validate([
            'id_karyawan' => 'required|exists:karyawans,id_karyawan',
            'tanggal' => 'required|date|unique:absensis,tanggal,NULL,id_absensi,id_karyawan,' . $request->id_karyawan,
            'jam_masuk' => 'nullable|date_format:H:i:s',
            'jam_keluar' => 'nullable|date_format:H:i:s|after_or_equal:jam_masuk',
            'status' => 'required|in:hadir,izin,sakit,alpha',
        ]);

        $absensi = Absensi::create($validated);

        return response()->json($absensi, 201);
    }

    // DETAIL ABSENSI
    // public function show($id)
    // {
    //     return response()->json(Absensi::with('karyawan')->findOrFail($id));
    // }

    // UPDATE ABSENSI
    public function update(Request $request, $id)
    {
        $absensi = Absensi::findOrFail($id);

        $validated = $request->validate([
            'jam_masuk' => 'nullable|date_format:H:i:s',
            'jam_keluar' => 'nullable|date_format:H:i:s|after_or_equal:jam_masuk',
            'status' => 'nullable|in:hadir,izin,sakit,alpha',
        ]);

        $absensi->update($validated);

        return response()->json($absensi);
    }

    // HAPUS ABSENSI
    public function destroy($id)
    {
        $absensi = Absensi::findOrFail($id);
        $absensi->delete();

        return response()->json(['message' => 'Absensi deleted']);
    }
}