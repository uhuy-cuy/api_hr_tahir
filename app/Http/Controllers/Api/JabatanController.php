<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Jabatan;

class JabatanController extends Controller
{
    // LIST SEMUA JABATAN
    public function index()
    {
        return response()->json(Jabatan::all());
    }

    // TAMBAH JABATAN
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_jabatan' => 'required|string|unique:jabatans,nama_jabatan',
        ]);

        $jabatan = Jabatan::create($validated);

        return response()->json($jabatan, 201);
    }

    // DETAIL JABATAN
    public function show($id)
    {
        return response()->json(Jabatan::findOrFail($id));
    }

    // UPDATE JABATAN
    public function update(Request $request, $id)
    {
        $jabatan = Jabatan::findOrFail($id);

        $validated = $request->validate([
            'nama_jabatan' => 'required|string|unique:jabatans,nama_jabatan,' . $id . ',id_jabatan',
        ]);

        $jabatan->update($validated);

        return response()->json($jabatan);
    }

    // HAPUS JABATAN
    public function destroy($id)
    {
        $jabatan = Jabatan::findOrFail($id);
        $jabatan->delete();

        return response()->json(['message' => 'Jabatan deleted']);
    }
}