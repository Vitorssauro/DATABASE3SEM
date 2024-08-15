<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vagas extends Model
{
    use HasFactory;
    //atributos
    protected $fillbase = [
        'titulo',
        'descricao',
        'setor',
        'remuneracao',
        'empresa',
    ];
}
