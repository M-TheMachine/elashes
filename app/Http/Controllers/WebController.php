<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Categoria;
use App\Models\Sucursal;
use App\Models\Cliente;
use App\Models\User;
use App\Models\Servicio;
use App\Models\Venta;
use App\Models\Tecnica;
use Illuminate\Support\Facades\Auth;

class WebController extends Controller
{
    public $ids = [];
    public function clientes(){
        return view('cliente.index');
    }

    public function vercliente($id){
        return view('cliente.view',compact('id'));
    }

    public function categorias(){
        return view('categoria.index');
    }

    public function getcategorias(){
        $categorias = Categoria::latest()->get();
        foreach ($categorias as $key => $value) {
            $nombre = "";
            if ($value->categoria) {
                $cat = $value->categoria;
                $nombre = $cat->nombre;
                while (isset($cat)) {
                    $cat = $cat->categoria;
                    if(isset($cat->nombre)){
                        $nombre = $cat->nombre." / ".$nombre;
                    }
                }
            }
            $value['nombre2'] = $nombre ? $nombre." / ".$value->nombre : $value->nombre;
            // $cat = $value->categorias;
        }
        $data = array('data' => $categorias);
        return response()->json($data);
    }

    public function gettecnicas(){
        $tecnica = Tecnica::latest()->get();
        
        $data = array('data' => $tecnica);
        return response()->json($data);
    }

    public function servicios(){
        return view('servicio.index');
    }

    public function getsucursals(){
        $datos = Sucursal::all();
        $data = array('data' => $datos);
        return response()->json($data);
    }

    public function sucursales(){
        return view('sucursal.index');
    }

    public function verreportesucursal($id){
        $susursal = Sucursal::find($id);
        return view('sucursal.view',compact(['susursal']));
    }

    public function reportes(){
        $susursal = Sucursal::first();
        return view('sucursal.view',compact(['susursal']));
    }

    public function usuarios(){
        return view('usuario.index');
    }

    public function verusuario($id){
        return view('usuario.view',compact('id'));
    }

    public function ventas(){
        return view('venta.index');
    }

    public function nuevaventa(){
        return view('venta.nueva');
    }

    public function recordatorios(){
        return view('recordatorio.index');
    }


    public function getservicios(Request $request)
    {
        $perPage = 8;
        $hayResultados = true;
        if ($request->categoria_id) {
            try {
                $this->ids=[(int)$request->categoria_id];
                $this->getcategoriasdata($request->categoria_id);
                $categorias = Categoria::where('categoria_id',$request->categoria_id)->get();
    
                //dd($this->ids);
            } catch (\Throwable $th) {
                dd($th);
            }
            
        }
        

        $datos = Servicio::where('estado',"habilitado")
        ->where(function($query) use($request){
            $query->where('nombre','LIKE',"%$request->search%")
            ->orWhere('precio', 'LIKE', "%$request->search%")
            ->orWhere('codigo', 'LIKE', "%$request->search%");
        })
         //Forzamos la entrada al bucle

        ->where(function($query) use($request){
            // $request->categoria_id
            if ($request->categoria_id) {
                $query->whereIn('categoria_id',$this->ids);
            }
 
        })

        ->orderBy('promocion', 'desc')
        // ->latest()
        ->paginate($perPage);
        foreach ($datos as $key => $value) {
            // $value->categoria;
            $nombre = "";
            if ($value->categoria) {
                $cat = $value->categoria;
                $nombre = $cat->nombre;
                while (isset($cat)) {
                    $cat = $cat->categoria;
                    if(isset($cat->nombre)){
                        $nombre = $cat->nombre." / ".$nombre;
                    }
                }
            }
            $value['nombre2'] = $nombre;
        }
        $data = array('data' => $datos);
        return response()->json($data);
    }
    public function getcategoriasdata($id){
        $categorias = Categoria::where('categoria_id',$id)->get();
        foreach ($categorias as $key => $value) {
            array_push($this->ids,$value->id);
            $this->getcategoriasdata($value->id);
        }
    }
    public function clientesdata(Request $request){
        $clientes = Cliente::where(function($query) use($request){
            $query->where('nombre','LIKE',"%$request->search%")
            ->orWhere('ci', 'LIKE', "%$request->search%")
            ->orWhere('celular', 'LIKE', "%$request->search%");
        })
        ->orderBy('nombre', 'DESC')
        ->limit(300)
        ->get();
        $data = array('data' => $clientes);
        return response()->json($data);
    }
    public function serviciosdata(Request $request){
        $servicios = Servicio::where(function($query) use($request){
            $query->where('nombre','LIKE',"%$request->search%")
            ->orWhere('descripcion', 'LIKE', "%$request->search%")
            ->orWhere('codigo', 'LIKE', "%$request->search%");
        })
        ->orderBy('nombre', 'DESC')
        ->limit(300)
        ->get();
        $data = array('data' => $servicios);
        return response()->json($data);
    }



    public function getOperadors(Request $request){
        // $clientes = User::where(function($query) use($request){
        //     $query->where('nombre','LIKE',"%$request->search%")
        //     ->orWhere('ci', 'LIKE', "%$request->search%")
        //     ->orWhere('celular', 'LIKE', "%$request->search%");
        // })
        // ->orderBy('nombre', 'DESC')
        // ->limit(300)
        // ->get();
        $sucursals = Auth::user()->sucursals->pluck('id');
        // $sucursals = array();
        // foreach ($user->sucursals as $key => $value) {
        //     array_push($sucursals,$value->id);
        // }
        $users = User::where('rol',"operador")
        ->whereHas('sucursals', function ($query) use($sucursals) {
            $query->whereIn('sucursals.id', $sucursals);
        })
        ->orderBy('nombre', 'DESC')
        ->get();
        $data = array('data' => $users);
        return response()->json($data);
    }

    public function selectsucursal(Request $request){
        // dd($request);
        $campos=[
            'sucursal_id' => ['required']
        ];
        $this->validate($request,$campos);
        session(['sucursal_id'=>$request->sucursal_id]);
        return redirect()->back()->with('Mensaje',"Sucursal seleccionada");

    }

    public function pagos()
    {
        $susursal = Sucursal::find(session('sucursal_id'));
        return view('pagos.index',compact('susursal'));
    }

    public function pagosOperador(Request $request){
        $perPage = 25;

        $comision = Venta::
        where('sucursal_id',session('sucursal_id'))
        ->where(function($query) use($request){
            if($request->operador_id){
                $query->where('user_id',$request->operador_id);
            }
            if($request->fecha){
                $query->whereDate('created_at',$request->fecha);
            }
        })
        ->where('estado', 'aceptado')
        ->orderBy('created_at', 'DESC')
        ->orderBy('ficha', 'DESC')
        ->sum('comision');

        $caja = Venta::
        where('sucursal_id',session('sucursal_id'))
        ->where(function($query) use($request){
            if($request->operador_id){
                $query->where('user_id',$request->operador_id);
            }
            if($request->fecha){
                $query->whereDate('created_at',$request->fecha);
            }
        })
        ->where('estado', 'aceptado')
        ->orderBy('created_at', 'DESC')
        ->orderBy('ficha', 'DESC')
        ->sum('caja');

        // dd($comision);
        $datos = Venta::
        where('sucursal_id',session('sucursal_id'))
        ->where(function($query) use($request){
            if($request->operador_id){
                $query->where('user_id',$request->operador_id);
            }
            if($request->fecha){
                $query->whereDate('created_at',$request->fecha);
            }
        })
        ->where('estado', 'aceptado')
        ->orderBy('created_at', 'DESC')
        ->orderBy('ficha', 'DESC')
        ->paginate($perPage);
        foreach ($datos as $key => $value) {
            $value->cliente;
            $value->servicio;
            $value->user;
        }
        $data = array('data' => $datos, 'comision'=>$comision, 'caja'=>$caja);
        return response()->json($data);
    }
}
