<?php

namespace App\Http\Controllers;

use App\Models\Venta;
use App\Models\User;
use App\Models\RecordatorioVenta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Excel;
use DB;
use App\Exports\VentasExport;
use Illuminate\Database\Eloquent\Builder;

class VentaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $perPage = 25;
        //dd($request->switchVentas);
        $datos = Venta::where(function($qr) use ($request){
            $qr->whereHas('cliente', function($q) use ($request){
                $q->where('nombre','LIKE',"%$request->search%");
            })
            ->orWhereHas('servicio', function($q) use ($request){
                $q->where('nombre','LIKE',"%$request->search%");
            });

        })
        ->where(function($qr) use ($request){
            if ($request->switchVentas == "1") {
                $qr->where('facturado', $request->switchVentas);
            }
        })
        ->where('sucursal_id',session('sucursal_id'))
        ->whereDate('created_at','>=',now())
        // ->where(function($query) use($request){
        //     if(Auth::user()->rol != 'root'){
        //         $query->where('facturado',1);
        //     }
        //     if($request->f_ini != '' && $request->f_fin != ''){
        //         // $query->whereBetween('created_at',[$request->f_ini,$request->f_fin]);
        //         $query->whereDate('created_at','>=',$request->f_ini)
        //         ->whereDate('created_at','<=',$request->f_fin);
        //     }else{
        //         if ($request->f_ini != '') {
        //             $query->whereDate('created_at','>=',$request->f_ini);
        //         }elseif ($request->f_fin != '') {
        //             $query->whereDate('created_at','<=',$request->f_fin);
        //         }
        //     }
        // })
        // ->whereBetween('created_at',[$request->f_ini,$request->f_fin])
        // withCount('detalles')->where(function($query) use($request){
        //     $query->where('nombre','LIKE',"%$request->search%")
        //     ->orWhere('ci', 'LIKE', "%$request->search%")
        //     ->orWhere('celular', 'LIKE', "%$request->search%")
        //     ->orWhere('username', 'LIKE', "%$request->search%")
        //     ->orWhere('email', 'LIKE', "%$request->search%")
        //     ->orWhere('rol', 'LIKE', "%$request->search%");
        // })
        // ->latest()
        ->orderBy('created_at', 'DESC')
        ->orderBy('ficha', 'DESC')
        ->paginate($perPage);
        foreach ($datos as $key => $value) {
            $value->cliente;
            $value->servicio;
            $value->user;
            $value->tecnica;
            $nombre = "";
            if ($value->servicio->categoria) {
                $cat = $value->servicio->categoria;
                $nombre = $cat->nombre;
                while (isset($cat)) {
                    $cat = $cat->categoria;
                    if(isset($cat->nombre)){
                        $nombre = $cat->nombre." / ".$nombre;
                    }
                }
            }
            $value->servicio['nombre2'] = $nombre;
        }
        $data = array('data' => $datos);
        return response()->json($data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $campos=[
            'ventas' => 'required',
        ];
        $this->validate($request,$campos);
        $ventas =  json_decode($request->ventas);
        // dd($ventas);
        $ficha = 1;
        $ultimv = Venta::whereDate('created_at', '=', date('Y-m-d'))->whereNotNull('ficha')->orderBy('ficha', 'DESC')->first();
        if ($ultimv) {
            $ficha = $ultimv->ficha+1;
        }
        // dd($ultimv);
        $ids=[];
        foreach ($ventas as $key => $value) {

            // dd($value->cliente_id);
            $val2['sucursal_id'] = session('sucursal_id');
            // $value['registradopor'] = Auth::user()->id;
            // Venta::create($val2);
            $deta = new Venta();
            $deta->sucursal_id = session('sucursal_id');
            $deta->cliente_id = $value->cliente_id;
            $deta->servicio_id = $value->servicio_id;
            $deta->user_id = $value->user_id ? $value->user_id : null;
            $deta->tecnica_id = $value->tecnica_id ? $value->tecnica_id : null;
            $deta->facturado = $value->facturado;
            $deta->precio = $value->precio;
            $deta->cantidad = $value->cantidad;
            $deta->ficha = $ficha;
            $deta->descuento = $value->descuento;
            $deta->subtotal = $value->subtotal;
            $deta->total = $value->total;
            $deta->descripcion = $value->descripcion;
            $deta->estado = $value->estado;
            $deta->pago = $value->pago;
            $deta->save();
            $deta->comision = $deta->servicio->comision;
            $deta->caja = $value->total-$deta->servicio->comision;
            $deta->update();
            array_push($ids,$deta->id);
            $ficha++;
            foreach ($deta->servicio->recordatorios as $keyr => $valuer) {
                $deta->recordatorios()->attach($valuer->id, ['fecha' => now()->addDays($valuer->dias),'recordado' => 0]);
            }
            // $deta->attach($roleId, ['expires' => $expires]);
            // $deta->recordatorios()->saveMany([
            //     new Comment(['message' => 'A new comment.']),
            //     new Comment(['message' => 'Another new comment.']),
            // ]);
        }
        $ventasdata = Venta::whereIn('id', $ids)->get();
        foreach ($ventasdata as $key => $value) {
            $value->cliente;
            $value->servicio;
            $value->user;
            $value->tecnica;
            $nombre = "";
            if ($value->servicio->categoria) {
                $cat = $value->servicio->categoria;
                $nombre = $cat->nombre;
                while (isset($cat)) {
                    $cat = $cat->categoria;
                    if(isset($cat->nombre)){
                        $nombre = $cat->nombre." / ".$nombre;
                    }
                }
            }
            $value->servicio['nombre2'] = $nombre;
        }
        return response()->json(['data'=>$ventasdata,'mensaje'=>"Venta registrada"], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Venta  $venta
     * @return \Illuminate\Http\Response
     */
    public function show(Venta $venta)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Venta  $venta
     * @return \Illuminate\Http\Response
     */
    public function edit(Venta $venta)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Venta  $venta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // dd($request['codigo']);
        $venta = Venta::find($id);
        $this->validate($request, [
            'codigo' => 'required',
        ]);
        $user = User::where('codigo',$request->codigo)
        ->where(function($qr1) use($venta){
            $qr1->where('rol','root')
            ->orWhere(function($query) use($venta){
                $query->where('rol','admin')
                ->whereHas('sucursals', function ($query1) use($venta) {
                    $query1->where('sucursals.id', $venta->sucursal_id);
                });
            });
        })
        ->count();
        if($user > 0){
            $mensaje = "Actualizado correctamente";
            $venta->estado = $request->estado;
            $venta->user_id = $request->user_id;
            $venta->update();
        }else{
            $mensaje = "Código no es valido";
        }


        return response()->json(['mensaje'=>$mensaje], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Venta  $venta
     * @return \Illuminate\Http\Response
     */
    public function destroy(Venta $venta)
    {
        //
    }

    public function exportVentas(Request $request)
    {
        return Excel::download(new VentasExport($request), 'ventas.xlsx');
        // $ventas = Venta::
        // join('servicios', 'ventas.servicio_id', '=', 'servicios.id')
        // ->join('sucursals', 'ventas.sucursal_id', '=', 'sucursals.id')
        // ->join('clientes', 'ventas.cliente_id', '=', 'clientes.id')
        // ->leftjoin('users', 'ventas.user_id', '=', 'users.id')
        // ->select('ventas.id', 'servicios.nombre','ventas.precio','ventas.cantidad',
        // 'ventas.subtotal','ventas.descuento','ventas.total','ventas.estado','clientes.nombre',
        // 'sucursals.nombre',
        // DB::raw("(case when ventas.user_id is NULL then 'SIN ASIGNAR' else users.nombre end) as operadora"))
        // ->get();
        // dd($ventas);
    }

    public function ventasupdate(Request $request){
        $campos=[
            'ventas' => 'required',
            'codigo' => 'required',
        ];
        $this->validate($request,$campos);


        $user = User::where('codigo',$request->codigo)
        ->where(function($qr1){
            $qr1->where('rol','root')
            ->orWhere(function($query){
                $query->where('rol','admin')
                ->whereHas('sucursals', function ($query1){
                    $query1->where('sucursals.id', session('sucursal_id'));
                });
            });
        })
        ->count();
        if ($user > 0) {
            $ventas =  json_decode($request->ventas);
            foreach ($ventas as $key => $value) {
                $deta = Venta::find($value->id);
                // $value->user = json_decode($value->user);
                if($value->user){
                    $deta->user_id = $value->user->id ? $value->user->id : null;
                }
                if($value->tecnica){
                    $deta->tecnica_id = $value->tecnica->id ? $value->tecnica->id : null;
                }
                // $deta->facturado = $value->facturado;
                // $deta->precio = $value->precio;
                // $deta->cantidad = $value->cantidad;
                // $deta->ficha = $ficha;
                // $deta->descuento = $value->descuento;
                // $deta->subtotal = $value->subtotal;
                // $deta->total = $value->total;
                // $deta->descripcion = $value->descripcion;
                $deta->estado = $value->estado;
                // $deta->pago = $value->pago;
                $deta->update();
            }
            return response()->json(['mensaje'=>"Ventas actualizadas correctamente"], 200);
        }else{
            return response()->json(['mensaje'=>"Código no es valido"], 200);
        }
    }

}
