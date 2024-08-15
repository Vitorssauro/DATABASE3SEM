<?php


namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Vagas;


class VagasController extends Controller
{


    public function index()
    {
        $vagas = Vagas::all();
        return view('vagas.index', compact('vagas'));
    }


    public function create()
    {
        return view('vagas.create');
    }


    public function store(Request $request)
    {
        $request->validate([
            'nome' => 'required',
            'preco' => 'required|decimal',
        ]);


        Vagas::create($request->all());


        return redirect()->route('vagas.index')
            ->with('success', 'vaga criado com sucesso.');
    }


    public function show(Vagas $vaga)
    {
        return view('vagas.show', compact('vaga'));
    }


    public function edit(Vagas $vaga)
    {
        return view('vaga.edit', compact('vaga'));
    }


    public function update(Request $request, Vagas $vaga)
    {
        $request->validate([
            'nome' => 'required',
            'preco' => 'required|decimal',
        ]);
        $vaga->update($request->all());
        return redirect()->route('vagas.index')
            ->with('success', 'vaga atualizado com sucesso.');
    }


    public function destroy(Vagas $vaga)
    {
        $vaga->delete();


        return redirect()->route('vagas.index')
            ->with('success', 'vaga Deletado com Sucesso.');
    }
}
