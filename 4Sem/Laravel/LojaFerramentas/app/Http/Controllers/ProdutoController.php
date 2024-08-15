<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Produto;
use Illuminate\Http\Request;

class ProdutoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $produtos = Produto::all();
        return view('produtos.index', compact('produtos'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('produtos.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'nome' => 'required|string|max:255',
            'descricao' => 'required',
            'categoria' => 'required',
            'quantidade' => 'required|numeric',
            'preco' => 'required|numeric',
        ]);

        Produto::create($request->all());

        return redirect()->route('produtos.index')
            ->with('success', 'produto criado com sucesso.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Produto $produtos)
    {
        return view('produtos.show', compact('produtos'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Produto $produtos)
    {
        return view('produtos.edit', compact('produtos'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Produto $produtos)
    {
        $request->validate([
            'nome' => 'required|string|max:255',
            'descricao' => 'required',
            'categoria' => 'required',
            'quantidade' => 'required|numeric',
            'preco' => 'required|numeric',
        ]);

        $produtos->update($request->all());

        return redirect()->route('produtos.index')
            ->with('success', 'produto atualizado com sucesso.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Produto $produtos)
    {
        $produtos->delete();


        return redirect()->route('produtos.index')
            ->with('success', 'produto Deletado com Sucesso.');
    }
}