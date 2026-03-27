<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Karyawan;
use Illuminate\Support\Facades\Validator;

class KaryawanController extends Controller
{
    public function index()
    {
        return response()->json(Karyawan::with(['jabatan', 'departemen'])->get());
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama' => 'required|string|max:255',
            'nik' => 'required|unique:karyawans,nik',
            'email' => 'required|email|unique:karyawans,email',
            'phone' => 'required',
            'id_jabatan' => 'required|exists:jabatans,id_jabatan',
            'id_departemen' => 'required|exists:departemens,id_departemen',
            'status' => 'required|in:aktif,non-aktif',
        ], [
            'nik.unique' => 'NIK sudah digunakan.',
            'email.unique' => 'Email sudah digunakan.',
            'nama.required' => 'Nama wajib diisi.',
            'id_jabatan.required' => 'Jabatan wajib dipilih.',
            'id_departemen.required' => 'Departemen wajib dipilih.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validasi gagal.',
                'errors' => $validator->errors()
            ], 422);
        }

        $karyawan = Karyawan::create($request->all());

        return response()->json([
            'success' => true,
            'message' => 'Data karyawan berhasil disimpan.',
            'data' => $karyawan
        ]);
    }

    public function show($id)
    {
        return response()->json(Karyawan::with(['jabatan', 'departemen'])->findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $karyawan = Karyawan::find($id);
        if (!$karyawan) {
            return response()->json([
                'success' => false,
                'message' => 'Karyawan tidak ditemukan.'
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'nama' => 'required|string|max:255',
            'nik' => 'required|unique:karyawans,nik,' . $id . ',id_karyawan',
            'email' => 'required|email|unique:karyawans,email,' . $id . ',id_karyawan',
            'phone' => 'required',
            'id_jabatan' => 'required|exists:jabatans,id_jabatan',
            'id_departemen' => 'required|exists:departemens,id_departemen',
            'status' => 'required|in:aktif,non-aktif',
        ], [
            'nik.unique' => 'NIK sudah digunakan.',
            'email.unique' => 'Email sudah digunakan.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validasi gagal.',
                'errors' => $validator->errors()
            ], 422);
        }

        $karyawan->update($request->all());

        return response()->json([
            'success' => true,
            'message' => 'Data karyawan berhasil diupdate.',
            'data' => $karyawan
        ]);
    }
    public function count()
    {
        $data = Karyawan::select('id_karyawan', 'status')->get();

        return response()->json($data);
    }
    public function destroy($id)
    {
        $karyawan = Karyawan::findOrFail($id);
        $karyawan->delete();

        return response()->json(['message' => 'Karyawan deleted']);
    }
}