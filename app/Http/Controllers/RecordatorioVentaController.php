<?php

namespace App\Http\Controllers;

use App\Models\RecordatorioVenta;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;

class RecordatorioVentaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $perPage = 25;
        $datos = RecordatorioVenta::whereHas('venta', function (Builder $query) use ($request) {
            $query->where('estado','aceptado')
            ->where('sucursal_id',session('sucursal_id'))
            ->where(function($qrd) use($request){
                $qrd->whereHas('cliente', function($q) use ($request){
                    $q->where('nombre','LIKE',"%$request->search%");
                })
                ->orWhereHas('servicio', function($q) use ($request){
                    $q->where('nombre','LIKE',"%$request->search%");
                });
            });
            if ($request->estado != 'todos') {
                $query->where('recordado',$request->estado);
            }
        })
        ->whereDate('fecha','<=',now()->addDay(1))
        ->where(function($query) use($request){
            if($request->f_ini != '' && $request->f_fin != ''){
                // $query->whereBetween('fecha',[$request->f_ini,$request->f_fin]);
                $query->whereDate('fecha','>=',$request->f_ini)
                ->whereDate('fecha','<=',$request->f_fin);
            }else{
                if ($request->f_ini != '') {
                    $query->whereDate('fecha','>=',$request->f_ini);
                }elseif ($request->f_fin != '') {
                    $query->whereDate('fecha','<=',$request->f_fin);
                }
            }

        })
        ->orderBy('fecha', 'DESC')
        ->paginate($perPage);
        foreach ($datos as $key => $value) {
            $value->venta->cliente;
            $value->venta->servicio;
            $value->venta->user;
            $value->recordatorio;
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\RecordatorioVenta  $recordatorioVenta
     * @return \Illuminate\Http\Response
     */
    public function show(RecordatorioVenta $recordatorioVenta)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\RecordatorioVenta  $recordatorioVenta
     * @return \Illuminate\Http\Response
     */
    public function edit(RecordatorioVenta $recordatorioVenta)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\RecordatorioVenta  $recordatorioVenta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $recordatorioVenta = RecordatorioVenta::find($id);
        $campos=[
            'recordado' => 'required',
        ];
        $this->validate($request,$campos);
        $recordatorioVenta->recordado  = $request->recordado;
        $recordatorioVenta->update();
        return response()->json(['mensaje'=>'Recordatorio actualizadas correctamente'], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\RecordatorioVenta  $recordatorioVenta
     * @return \Illuminate\Http\Response
     */
    public function destroy(RecordatorioVenta $recordatorioVenta)
    {
        //
    }
}
