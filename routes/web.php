<?php

use App\Http\Controllers\ClienteController;
use App\Http\Controllers\VentaController;
use App\Http\Controllers\SucursalController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\WebController;
use App\Models\Sucursal;
use Illuminate\Routing\RouteGroup;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    // return view('welcome');
    return redirect('/login');
});



Route::middleware(['auth'])->group(function () {

    Route::middleware(['rootA'])->group(function () {
        Route::resource('categoria', App\Http\Controllers\CategoriaController::class);
        Route::resource('servicio', App\Http\Controllers\ServicioController::class);
        Route::resource('tecnica', App\Http\Controllers\TecnicaController::class);
        Route::resource('sucursal', App\Http\Controllers\SucursalController::class);
        Route::resource('usuario', App\Http\Controllers\UsuarioController::class);
        Route::resource('recordatorio', App\Http\Controllers\RecordatorioController::class);


        Route::post('/importcl', [ClienteController::class, 'importcl']);
        Route::get('/exportClientes', [ClienteController::class, 'exportClientes']);

        //Route::get('/recordatorios', [WebController::class, 'recordatorios']);
        Route::get('/getserviciosusuario', [App\Http\Controllers\UsuarioController::class, 'getserviciosusuario']);


        Route::get('/categorias', [WebController::class, 'categorias']);
        

        

        Route::get('/servicios', [WebController::class, 'servicios']);

        Route::get('/sucursales', [WebController::class, 'sucursales']);

        




        Route::get('/getsucursals', [WebController::class, 'getsucursals']);

        Route::get('/usuarios', [WebController::class, 'usuarios']);
        Route::get('/verusuario/{id}', [WebController::class, 'verusuario']);

        Route::get('/exportVentas', [VentaController::class, 'exportVentas']);
    });

    Route::middleware(['rootAS'])->group(function () {

        Route::get('/reportes', [WebController::class, 'reportes']);
        Route::get('/verreportesucursal/{id}', [WebController::class, 'verreportesucursal']);
        Route::get('/ventasSucursal', [SucursalController::class, 'ventasSucursal']);
        // report sucursal
        Route::get('/exportVentasSucursal', [SucursalController::class, 'exportVentasSucursal']);
        // fin report sucursal
    });

    Route::middleware(['rootASV'])->group(function () {
        Route::get('/getcategorias', [WebController::class, 'getcategorias']);
        Route::get('/gettecnicas', [WebController::class, 'gettecnicas']);
        
        Route::get('/recordatorios', [WebController::class, 'recordatorios']);
        Route::get('/clientes', [WebController::class, 'clientes']);
        Route::get('/vercliente/{id}', [WebController::class, 'vercliente']);
        Route::get('/ventasCliente', [App\Http\Controllers\ClienteController::class, 'ventasCliente']);
        Route::resource('cliente', App\Http\Controllers\ClienteController::class);
        Route::resource('venta', App\Http\Controllers\VentaController::class);
        Route::resource('recordatorioventa', App\Http\Controllers\RecordatorioVentaController::class);
        Route::get('/getOperadors', [WebController::class, 'getOperadors']);
        Route::post('/selectsucursal', [WebController::class, 'selectsucursal']);


        Route::get('/ventas', [WebController::class, 'ventas']);
        Route::post('/ventasupdate', [VentaController::class, 'ventasupdate']);
        Route::get('/nuevaventa', [WebController::class, 'nuevaventa']);
        Route::get('/clientesdata', [WebController::class, 'clientesdata']);
        Route::get('/serviciosdata', [WebController::class, 'serviciosdata']);
        Route::get('/getservicios', [WebController::class, 'getservicios']);

        Route::get('/pagos', [WebController::class, 'pagos']);
        Route::get('/pagosOperador', [WebController::class, 'pagosOperador']);

    });
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
});

Auth::routes();



