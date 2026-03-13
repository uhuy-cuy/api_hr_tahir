<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Departemen;

class DepartemenController extends Controller
{
    // LIST SEMUA DEPARTEMEN
    public function index()
    {
        return response()->json(Departemen::all());
    }

    // TAMBAH DEPARTEMEN
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_departemen' => 'required|string|unique:departemens,nama_departemen',
        ]);

        $departemen = Departemen::create($validated);

        return response()->json($departemen, 201);
    }

    // DETAIL DEPARTEMEN
    public function show($id)
    {
        return response()->json(Departemen::findOrFail($id));
    }

    // UPDATE DEPARTEMEN
    public function update(Request $request, $id)
    {
        $departemen = Departemen::findOrFail($id);

        $validated = $request->validate([
            'nama_departemen' => 'required|string|unique:departemens,nama_departemen,' . $id . ',id_departemen',
        ]);

        $departemen->update($validated);

        return response()->json($departemen);
    }

    // HAPUS DEPARTEMEN
    public function destroy($id)
    {
        $departemen = Departemen::findOrFail($id);
        $departemen->delete();

        return response()->json(['message' => 'Departemen deleted']);
    }
}