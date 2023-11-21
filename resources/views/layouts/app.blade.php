<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="csrf_token()">

    <title>Nombre de la Aplicación</title>

    <!-- Scripts -->
    <script src="js/app.js" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="css/app.css" rel="stylesheet">
    <style>
        .navbar-custom {
            background-color: black;
        }
        .navbar-custom .navbar-nav .nav-link {
            color: white;
        }
        .navbar-custom .navbar-brand {
            color: white;
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(255, 255, 255, 1)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
        }

        .navbar-custom {
            background-color: black;
        }
        .navbar-custom .navbar-nav .nav-link {
            color: white;
        }
        .navbar-custom .navbar-brand {
            color: white;
        }
        .navbar-toggler-icon {
            /* [Estilo del ícono del menú] */
        }

        /* Estilos para el menú desplegable */
        .navbar-custom .dropdown-menu {
            background-color: black; /* Fondo negro */
        }
        .navbar-custom .dropdown-menu .dropdown-item {
            color: white; /* Texto blanco */
        }
        .navbar-custom .dropdown-menu .dropdown-item:hover {
            background-color: #505050; /* Fondo gris al pasar el ratón */
        }
    </style>
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
<body class="bg-black">
    <div id="app" class="w-auto h-75">
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container">
                <a class="navbar-brand" href="/home">
                    <img src="/images/logo.png" alt="Logo" style="height: 60px;">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <!-- Dropdown principal -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenu" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="navbar-toggler-icon"></span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenu">
                                @php $rol = auth()->user()->rol; @endphp
                                @if(in_array($rol, ['root', 'admin', 'vendedor']))
                                    <a class="dropdown-item" href="/clientes">Clientes</a>
                                @endif
                                @if(in_array($rol, ['root', 'admin']))
                                    <a class="dropdown-item" href="/servicios">Servicios</a>
                                    <a class="dropdown-item" href="/categorias">Categorías</a>
                                    <a class="dropdown-item" href="/reportes">Reportes</a>
                                    <a class="dropdown-item" href="/usuarios">Usuarios</a>
                                    <a class="dropdown-item" href="/pagos">Pagos</a>
                                    <a class="dropdown-item" href="/ventas">Ventas</a>
                                @endif
                                @if($rol == 'root')
                                    <a class="dropdown-item" href="/sucursales">Sucursales</a>
                                @endif
                                @if(in_array($rol, ['root', 'admin', 'vendedor', 'operador']))
                                    <a class="dropdown-item" href="/recordatorios">Recordatorios</a>
                                    <a class="dropdown-item" href="/nuevaventa">Nueva Venta</a>
                                @endif
                                <a class="dropdown-item" href="{{ route('logout') }}"
                                   onclick="event.preventDefault();
                                                 document.getElementById('logout-form').submit();">
                                    Cerrar Sesión
                                </a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    @csrf
                                </form>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <main class="d-flex h-100 w-100">
            @yield('content')
        </main>
    </div>
    @if (Auth::check())
    <!-- Scripts para funciones adicionales -->
    @endif
</body>
@endif
</html>
