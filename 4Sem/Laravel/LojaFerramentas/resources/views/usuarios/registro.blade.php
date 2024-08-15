@extends('layouts.app')


@section('content')
{{-- formulario --}}
<div class="container">
    <h1>Registrar-se</h1>
    <br>
    <form method="POST" action="{{ route('usuarios.registro') }}">
        @csrf


        <div class="form-group">
            <label for="name">Nome</label>
            <input type="text" name="name" class="form-control @error('name')is-invalid @enderror" value="{{old('name')}}" required>
        </div>

        @error('name')
            <div class='invalid-feedback'>{{$message}}</div>
        @enderror
        <br>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" name="email" class="form-control @error('email')is-invalid @enderror" value="{{old('email')}}" required>
        </div>

        @error('email')
            <div class='invalid-feedback'>{{$message}}</div>
        @enderror
        <br>

        <div class="form-group">
            <label for="password">Senha</label>
            <input type="password" name="password" class="form-control @error('password')is-invalid @enderror" value="{{old('password')}}" required>
        </div>
        
        @error('password')
            <div class='invalid-feedback'>{{$message}}</div>
        @enderror
        <br>

        <div class="form-group">
            <label for="password_confirmation">Confirme a Senha</label>
            <input type="password" name="password_confirmation" class="form-control" required>
        </div>
        <br>
        <button type="submit" class="btn btn-primary">Registrar-se</button>
    </form>
</div>


@endsection
