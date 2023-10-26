<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head class="bg-black">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
@if (request()->is('login'))
<body style="background: url(/images/fondo.jpg) no-repeat 50% fixed;background-size: cover;">
    <div id="app" class="w-auto h-100">
        <main class="py-4 d-flex h-100 w-100">
            @yield('content')
        </main>
    </div>
</body>
@else
<body class="bg-black  {{ Route::has('login') ? 'navbodyfloat' : '' }}">
    <div id="app" class="w-auto h-75 bg-black">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid bg-black">
                    @if (!request()->is('home'))
                        <span style="font-size:30px;cursor:pointer" class="text-white" onclick="openNav()">&#9776; Menú</span>
                    @endif
                    <a class="navbar-brand" href="{{ url('/home') }}">
                        <img class="img-fluid" src="{{ asset('images/logo.png') }}" width="100px" alt="">
                    </a>

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                        <i class="bi bi-person-circle menuuser"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <!-- Left Side Of Navbar -->
                        <ul class="navbar-nav mr-auto">

                        </ul>

                        <!-- Right Side Of Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <!-- Authentication Links -->
                            @guest
                                @if (Route::has('login'))
                                    <li class="nav-item">
                                        <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                                    </li>
                                @endif

                                @if (Route::has('register'))
                                    <li class="nav-item ">
                                        <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                    </li>
                                @endif
                            @else
                                {{-- <li class="nav-item">
                                    <a id="msucursal" class="nav-link text-white" style="font-size: 25px;" href="javascript:void(0)"
                                    data-backdrop="static" data-toggle="modal" data-target="#sucursalModalCenter">{{ __('Sucursal') }}</a>
                                </li> --}}
                                <li class="nav-item dropdown">
                                    <a id="navbarDropdown" class="nav-link dropdown-toggle text-white" style="font-size: 25px;" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                        {{ Auth::user()->nombre }}
                                    </a>

                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" style="font-size: 20px" href="{{ route('logout') }}"
                                        onclick="event.preventDefault();
                                                        document.getElementById('logout-form').submit();">
                                            {{ __('Logout') }}
                                        </a>

                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                            @csrf
                                        </form>
                                    </div>
                                </li>
                            @endguest
                        </ul>
                    </div>
                </div>
            </nav>

        <main class="d-flex h-100 w-100">
            @yield('content')
        </main>
    </div>
    @if (Auth::check())
        <div class="modal fade bg-black" id="sucursalModalCenter" tabindex="-1" role="dialog" aria-labelledby="sucursalModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <form method="POST" action="{{ url('selectsucursal') }}">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Sucursal</h5>
                        {{-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button> --}}
                    </div>
                    <div class="modal-body">
                        @foreach (auth()->user()->sucursals as $item)
                            <div class="custom-control custom-radio">
                                <input checked type="radio" value="{{ $item->id }}" id="sucursal{{ $item->id }}" name="sucursal_id" class="custom-control-input" {{ session()->has('sucursal_id') && (session('sucursal_id') == $item->id) ? 'checked' : '' }} required>
                                <label class="custom-control-label" for="sucursal{{ $item->id }}">{{ $item->nombre }}</label>
                            </div>
                        @endforeach

                        {{-- <div class="custom-control custom-radio">
                            <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
                            <label class="custom-control-label" for="customRadio2">Or toggle this other custom radio</label>
                        </div> --}}
                    </div>
                    <div class="modal-footer">
                        {{-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> --}}
                        <button type="submit" class="btn btn-primary">Guardar cambios</button>
                    </div>
                </form>
            </div>
            </div>
        </div>
        <script>
            // window.User = {
            //     id: {{ optional(auth()->user())->id }},
            //     avatar: '{{ optional(auth()->user())->nombre }}',
            // }
            if ({{ optional(auth()->user())->id }} && {{ (session('sucursal_id') ? 'false' : 'true') }}) {
                console.log("true auth");
                // $("#msucursal").trigger("click");
                // setTimeout(() => {
                //     document.getElementById('msucursal').click();
                // }, 1000);

            }
        </script>
        {{-- <script>
            $( document ).ready(function() {
                if(JSON.parse("{!! json_encode(Auth::check()) !!}"){
                    // var jobs = JSON.parse("{!! json_encode(Auth::user->sucursals) !!}");
                    // console.log(jobs);
                    $("#msucursal").trigger("click");
                    console.log('auth');

                }else{
                    console.log('not auth');
                }
            });
        </script> --}}
    @endif
    
    
      
    
    
    


    <div id="myNav" class="overlay">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div class="overlay-content">
            <div class="container d-flex">
                <div class="row justify-content-center m-auto">
                
                        <ul class="navbar-nav">
       
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="{{ url('ventas') }}">Ventas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{ url('pagos') }}">Pagos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{ url('recordatorios') }}">Recordatorios</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="{{ url('nuevaventa') }}">Nueva venta</a>
        </li>
      </ul>
                    @if (auth()->user()->rol == 'root' || auth()->user()->rol == 'admin')
                       

                            <!-- <div class="col-md-4 mt-4">

                            <a href="{{ url('clientes') }}">
                              
                                    <H1>Clientes</H1>
                                    
                                    {{-- <i class="" style="font-size: 120px;"></i>
                                    <div class="">
                                    <h5 class="">hola</h5>
                                 
                                </div> --}}
                            </a>
                        </div>
                    @endif
                    @if (auth()->user()->rol == 'root' || auth()->user()->rol == 'admin')

                        <div class="col-md-4 mt-4">
                            <a href="{{ url('servicios') }}">
                                <h1 class="">SERVICIOS</h1>
                                <div class="">
                                   {{-- <i class="" style="font-size: 120px;"></i>
                                    <div class="">
                                    <h5 class="">SERVICIOS</h5>
                                    </div> --}}
                                </div>
                            </a>
                        </div>

                        <div class="col-md-4 mt-4">
                            <a href="{{ url('categorias') }}">
                                <h1 class="">CATEGORÍAS</h1>
                                <div class="">
                                    {{-- <i class="" style="font-size: 120px;"></i>
                                    <div class="">
                                    <h5 class="">CATEGORÍAS</h5>
                                    </div> --}}
                                </div>
                            </a>
                        </div>
                    @endif
                    @if (auth()->user()->rol == 'root' || auth()->user()->rol == 'admin' || auth()->user()->rol == 'supervisor')
                        <div class="col-md-4 mt-4">
                            <a href="{{ url('reportes') }}">
                                <div class="card br20">
                                    <img src="{{ asset('images/reportes.png') }}" class="w-100 br20" alt="">
                                    
                                </div>
                            </a>
                        </div>
                    @endif
                    {{-- @if (auth()->user()->rol == 'root' || auth()->user()->rol == 'admin' || auth()->user()->rol == 'supervisor')
                        <div class="col-md-4 mt-4">
                            <a href="{{ url('sucursales') }}">
                                <div class="card br20">
                                    <img src="{{ asset('images/4.jpg') }}" class="w-100 br20" alt="">
                                    
                                </div>
                            </a>
                        </div>
                    @endif --}}


                    @if (auth()->user()->rol == 'root' || auth()->user()->rol == 'admin')
                        <div class="col-md-4 mt-4">
                            <a href="{{ url('usuarios') }}">
                                <div class="card br20">
                                    <img src="{{ asset('images/5.jpg') }}" class="w-100 br20" alt="">
                                    {{-- <i class="bi bi-people card-img" style="font-size: 120px;"></i>
                                    <div class="card-img-overlay">
                                    <h5 class="card-title">USUARIOS</h5>
                                    </div> --}}
                                </div>
                            </a>
                        </div>
                    @endif

            {{--
                    <div class="col-md-4 mt-4">
                        <a href="{{ url('') }}">
                            <div class="card br20">
                                <img src="{{ asset('images/6.jpg') }}" class="w-100 br20" alt="">
                            </div>
                        </a>
                    </div> --}}

                    @if (auth()->user()->rol == 'root' || auth()->user()->rol == 'admin' || auth()->user()->rol == 'supervisor' || auth()->user()->rol == 'secretario')
                        <div class="col-md-4 mt-4">
                            <a href="{{ url('ventas') }}">
                                <div class="card br20">
                                    <img src="{{ asset('') }}" class="w-100 br20" alt="">
                                    {{-- <i class="bi bi-people card-img" style="font-size: 120px;"></i>
                                    <div class="card-img-overlay">
                                    <h5 class="card-title">Ventas</h5>
                                    </div> --}}
                                </div>
                            </a>
                        </div>

                        <div class="col-md-4 mt-4">
                            <a href="{{ url('nuevaventa') }}">
                                <div class="card br20">
                                    <img src="{{ asset('images/10.png') }}" class="w-100 br20" alt="">
                                    {{-- <i class="bi bi-people card-img" style="font-size: 120px;"></i>
                                    <div class="card-img-overlay">
                                    <h5 class="card-title">REPORTES</h5>
                                    </div> --}}
                                </div>
                            </a>
                        </div>

                        <div class="col-md-4 mt-4">
                            <a href="{{ url('pagos') }}">
                                <div class="card br20">
                                    <img src="{{ asset('images/9.png') }}" class="w-100 br20" alt="">
                                    {{-- <i class="bi bi-people card-img" style="font-size: 120px;"></i>
                                    <div class="card-img-overlay">
                                    <h5 class="card-title">REPORTES</h5>
                                    </div> --}}
                                </div>
                            </a>
                        </div>

                        <div class="col-md-4 mt-4">
                            <a href="{{ url('recordatorios') }}">
                                <div class="card br20">
                                    <img src="{{ asset('images/8.jpg') }}" class="w-100 br20" alt="">
                                    {{-- <i class="bi bi-people card-img" style="font-size: 120px;"></i>
                                    <div class="card-img-overlay">
                                    <h5 class="card-title">REPORTES</h5>
                                    </div> --}}
                                </div>
                            </a>
                        </div>
                    @endif
                    {{-- <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">{{ __('Dashboard') }}</div>

                            <div class="card-body">
                                @if (session('status'))
                                    <div class="alert alert-success" role="alert">
                                        {{ session('status') }}
                                    </div>
                                @endif

                                {{ __('You are logged in!') }}
                            </div>
                        </div>
                    </div> --}}
                </div>
            </div>
            -->
 

    <script>
        function openNav() {
          document.getElementById("myNav").style.width = "100%";
        }

        function closeNav() {
          document.getElementById("myNav").style.width = "0%";
        }
     </script>
</body>
@endif
</html>
