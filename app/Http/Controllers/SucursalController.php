<?php

namespace App\Http\Controllers;

use App\Models\Sucursal;
use App\Models\Venta;
use Illuminate\Http\Request;
use Excel;
use DB;
use App\Exports\VentasSucursalExport;
use Illuminate\Support\Facades\Auth;

class SucursalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $perPage = 25;
        $datos = Sucursal::where(function($query) use($request){
            $query->where('nombre','LIKE',"%$request->search%")
            ->orWhere('direccion', 'LIKE', "%$request->search%");
        })->latest()->paginate($perPage);
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
            'nombre' => 'required|string|max:100',
        ];
        $this->validate($request,$campos);
        $requestData = $request->all();
        Sucursal::create($requestData);
        return response()->json(['mensaje'=>"Sucursal registrado"], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Sucursal  $sucursal
     * @return \Illuminate\Http\Response
     */
    public function show(Sucursal $sucursal)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Sucursal  $sucursal
     * @return \Illuminate\Http\Response
     */
    public function edit(Sucursal $sucursal)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Sucursal  $sucursal
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Sucursal $sucursal)
    {
        $campos=[
            'nombre' => 'required|string|max:100',
        ];
        $this->validate($request,$campos);
        $requestData = $request->all();
        $sucursal->update($requestData);
        return response()->json(['mensaje'=>'Sucursal Actualizado'], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Sucursal  $sucursal
     * @return \Illuminate\Http\Response
     */
    public function destroy(Sucursal $sucursal)
    {
        //
    }

    public function reporteventas(Sucursal $sucursal)
    {
        //
    }

    public function ventasSucursal(Request $request)
    {
        $perPage = 25;

        $datos = Venta::where(function($qr) use ($request){
            $qr->whereHas('cliente', function($q) use ($request){
                $q->where('nombre','LIKE',"%$request->search%");
            })
            ->orWhereHas('servicio', function($q) use ($request){
                $q->where('nombre','LIKE',"%$request->search%");
            });
        })
        ->where('sucursal_id',$request->sucursal_id)
        ->where(function($query) use($request){
            if($request->cliente_id){
                $query->where('cliente_id',$request->cliente_id);
            }
            if($request->servicio_id){
                $query->where('servicio_id',$request->servicio_id);
            }
            if($request->operador_id){
                $query->where('user_id',$request->operador_id);
            }

            if($request->f_ini != '' && $request->f_fin != ''){
                // $query->whereBetween('created_at',[$request->f_ini,$request->f_fin]);
                $query->whereDate('created_at','>=',$request->f_ini)
                ->whereDate('created_at','<=',$request->f_fin);
            }else{
                if ($request->f_ini != '') {
                    $query->whereDate('created_at','>=',$request->f_ini);
                }elseif ($request->f_fin != '') {
                    $query->whereDate('created_at','<=',$request->f_fin);
                }
            }
        })
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
        ->orderBy('created_at', 'DESC')
        ->orderBy('ficha', 'DESC')
        ->sum('caja');


        foreach ($datos as $key => $value) {
            $value->cliente;
            $value->servicio;
            $value->user;
        }
        $data = array('data' => $datos, 'comision'=>$comision, 'caja'=>$caja);
        return response()->json($data);
    }


    public function exportVentasSucursal(Request $request)
    {

        return Excel::download(new VentasSucursalExport($request), 'ventassucursal.xlsx');

    }
}
