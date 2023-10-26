<?php

namespace App\Http\Controllers;

use App\Models\Recordatorio;
use Illuminate\Http\Request;

class RecordatorioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $perPage = 25;
        $datos = Recordatorio::where('servicio_id',$request->id)->where(function($query) use($request){
            $query->where('nombre','LIKE',"%$request->search%")
            ->orWhere('dias', 'LIKE', "%$request->search%")
            ->orWhere('mensaje', 'LIKE', "%$request->search%");
        })->latest()->get();
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
            'dias' => 'required',
            'mensaje' => 'required',
            'servicio_id' => 'required',
        ];
        $this->validate($request,$campos);
        $requestData = $request->all();
        Recordatorio::create($requestData);
        return response()->json(['mensaje'=>"Recordatorio registrado"], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Recordatorio  $recordatorio
     * @return \Illuminate\Http\Response
     */
    public function show(Recordatorio $recordatorio)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Recordatorio  $recordatorio
     * @return \Illuminate\Http\Response
     */
    public function edit(Recordatorio $recordatorio)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Recordatorio  $recordatorio
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Recordatorio $recordatorio)
    {
        $campos=[
            'nombre' => 'required|string|max:100',
            'dias' => 'required',
            'mensaje' => 'required',
            'servicio_id' => 'required',
        ];
        $this->validate($request,$campos);
        $requestData = $request->all();
        $recordatorio->update($requestData);
        return response()->json(['mensaje'=>'Recordatorio Actualizado'], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Recordatorio  $recordatorio
     * @return \Illuminate\Http\Response
     */
    public function destroy(Recordatorio $recordatorio)
    {
        $recordatorio->delete();
        return response()->json(['mensaje'=>'Recordatorio Eliminado'], 200);
    }
}
