@if (Auth::check())
    <div>
        <h3>Olá, {{Auth::user()->name}}</h3>
        <h4>{{Auth::user()->tipo_usuario}}</h4>
    </div>
    <form action="{{route('usuarios.logout')}}" method="post">
        @csrf
        <button type="submit">Logout</button>
    </form>

@else
    <div>
        <ul>
            <li><a href="/login">Login</a></li>
            <li><a href="/registro">Registro</a></li>
        </ul>
    </div>
    
@endif