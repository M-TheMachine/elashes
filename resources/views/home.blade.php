@extends('layouts.app')

@section('content')

<link href="{{ asset('styles.css') }}" rel="stylesheet">

    
<div class="container  bg-black">
    <div class="row justify-content-center m-auto">
        <div class="">
            @if (session('error'))
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <strong>{{ session('error') }}</strong>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            @endif
        </div>
        
<div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
    <div class="text-center">
        <a href="{{ url('nuevaventa') }}" class="btn btn-primary btn-lg" role="button" aria-disabled="true">Nuevo ingreso</a>
        <a href="{{ url('recordatorios') }}" class="btn btn-secondary btn-lg" role="button" aria-disabled="true">Recordatorios</a>
    </div>
</div>

                   
<!-- <div class="col-md-12 mt-4 justify-content-center">
    <a href="{{ url('nuevaventa') }}">
        <button type="button" class="btn btn-primary btn-lg btn-block">Nuevo ingreso</button>
    </a>
</div> -->    
        
        
      <!--  @if (auth()->user()->rol == 'root' || auth()->user()->rol == 'admin')
             <div class="col-md-2 mt-2">

             <a href="{{ url('clientes') }}">
    <div class="button-big p-3 custom-button">
        <h5 class="d-flex justify-content-center">Clientes</h5>
    </div>
</a>-->


            </div>
        @endif
        @if (auth()->user()->rol == 'root' || auth()->user()->rol == 'admin')
        
        
        

           <!-- <div class="col-md-4 mt-4">
                <a href="{{ url('servicios') }}">
                    <div class="card br20">
                        <img src="{{ asset('images/2.jpg') }}" class="w-100 br20" alt="">
                        {{-- <i class="bi bi-people card-img" style="font-size: 120px;"></i>
                        <div class="card-img-overlay">
                        <h5 class="card-title">SERVICIOS</h5>
                        </div> --}}
                    </div>
                </a>
            </div>

            <div class="col-md-4 mt-4">
                <a href="{{ url('categorias') }}">
                    <div class="card br20">
                        <img src="{{ asset('images/3.jpg') }}" class="w-100 br20" alt="">
                        {{-- <i class="bi bi-people card-img" style="font-size: 120px;"></i>
                        <div class="card-img-overlay">
                        <h5 class="card-title">CATEGORÍAS</h5>
                        </div> --}}
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
        @if (auth()->user()->rol == 'root' || auth()->user()->rol == 'admin' || auth()->user()->rol == 'supervisor')
            <div class="col-md-4 mt-4">
                <a href="{{ url('reportes') }}">
                    <div class="card br20">
                        <img src="{{ asset('images/reportes.png') }}" class="w-100 br20" alt="">
                        
                    </div>
                </a>
            </div>
        @endif

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
            <!--<div class="col-md-4 mt-4">
                <a href="{{ url('ventas') }}"><h5 class="card-title">VENTAS</h5>
                    <div class="">  
                        {{-- <i class="bi bi-people card-img" style="font-size: 120px;"></i>
                        <div class="card-img-overlay">
                        <h5 class="card-title">REPORTES</h5>
                        </div> --}}
                    </div>
                </a>
            </div>



          <!--  <div class="col-md-4 mt-4">
                <a href="{{ url('pagos') }}">
                    <h1>Pagos</h1>
                    <div class="card br20">
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-12 mt-12">
                <a href="{{ url('recordatorios') }}">
                    <h1>Recordatorios</h1> 
                
                        
        
                    </div>
                </a>
            </div>-->
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
@endsection
