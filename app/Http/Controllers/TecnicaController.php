<?php

namespace App\Http\Controllers;

use App\Models\Tecnica;
use Illuminate\Http\Request;

class TecnicaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $perPage = 25;
        $datos = Tecnica::where(function($query) use($request){
            $query->where('nombre','LIKE',"%$request->search%")
            ->orWhere('descripcion', 'LIKE', "%$request->search%");            
        })->latest()->paginate($perPage);
        foreach ($datos as $key => $value) {
            $value->categoria;               
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
        $this->validate($request, [
            'nombre' => 'required',  
            'categoria_id' => 'required',
        ]);

        $requestData = $request->all();
        
        Tecnica::create($requestData);
        $mensaje = "Registrado correctamente";
        
        return response()->json(['mensaje'=>$mensaje], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Tecnica  $tecnica
     * @return \Illuminate\Http\Response
     */
    public function show(Tecnica $tecnica)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Tecnica  $tecnica
     * @return \Illuminate\Http\Response
     */
    public function edit(Tecnica $tecnica)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Tecnica  $tecnica
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Tecnica $tecnica)
    {
        $this->validate($request, [
            'nombre' => 'required',  
            'categoria_id' => 'required',
        ]);

        $requestData = $request->all();
        
        $tecnica->update($requestData);
        $mensaje = "Actualizados correctamente";
        
        return response()->json(['mensaje'=>$mensaje], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Tecnica  $tecnica
     * @return \Illuminate\Http\Response
     */
    public function destroy(Tecnica $tecnica)
    {
        if ($tecnica->ventas->count()>0) {
            $mensaje = "Error no se puede eliminar porque existen ventas relacionadas";
        }else{
            $tecnica->delete();
            $mensaje = "Eliminado correctamente";
        }
        return response()->json(['mensaje'=>$mensaje], 200);
    }
}
