<?php

namespace App\Http\Controllers;

use App\Models\Servicio;
use Illuminate\Http\Request;
use Image;
use File;
class ServicioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $perPage = 25;
        $datos = Servicio::where(function($query) use($request){
            $query->where('nombre','LIKE',"%$request->search%")
            ->orWhere('precio', 'LIKE', "%$request->search%")
            ->orWhere('codigo', 'LIKE', "%$request->search%");
        })->latest()->paginate($perPage);
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
            'precio' => 'required',
            'comision' => 'required',
            'estado' => 'required',
            'categoria_id' => 'required',
            'imagen' => 'required'
        ]);

        $requestData = $request->all();
        if($request->hasFile('imagen')){
            $image = Image::make($request->file('imagen'))->fit(350, 350);
            $extension = $request->file('imagen')->getClientOriginalExtension();
            $fileName = rand(0,10)."-".date('his')."-".rand(0,10).".".$extension;
            $path  = 'img/Servicio';
            if (!file_exists($path)) {
                mkdir($path, 0777, true);
            }
            $img = $path.'/'.$fileName;
            if($image->save($img)) {
                // $requestData['imagen'] = $img;
                $requestData['imagen'] = $img;
                Servicio::create($requestData);
                $mensaje = "Registrado correctamente";
            }else{
                $mensaje = "Error al guardar la imagen";
            }

        }else{

            Servicio::create($requestData);
            $mensaje = "Registrado correctamente";
        }

        return response()->json(['mensaje'=>$mensaje], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Servicio  $servicio
     * @return \Illuminate\Http\Response
     */
    public function show(Servicio $servicio)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Servicio  $servicio
     * @return \Illuminate\Http\Response
     */
    public function edit(Servicio $servicio)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Servicio  $servicio
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $servicio = Servicio::find($id);
        $this->validate($request, [
            'nombre' => 'required',
            'precio' => 'required',
            'comision' => 'required',
            'estado' => 'required',
            'categoria_id' => 'required'
        ]);

        $requestData = $request->all();
        $mensaje = "Actualizado correctamente";
        if($request->hasFile('imagen')){
            $image = Image::make($request->file('imagen'))->fit(350, 350);
            $extension = $request->file('imagen')->getClientOriginalExtension();
            $fileName = rand(0,10)."-".date('his')."-".rand(0,10).".".$extension;
            $path  = 'img/Servicio';
            if (!file_exists($path)) {
                mkdir($path, 0777, true);
            }
            $img = $path.'/'.$fileName;
            if($image->save($img)) {
                $archivo_antiguo = $servicio->imagen;
                $requestData['imagen'] = $img;
                $mensaje = "Actualizado correctamente :3";
                if ($archivo_antiguo != '' && !File::delete($archivo_antiguo)) {
                    $mensaje = "Actualizado. error al eliminar la imagen";
                }
                $servicio->update($requestData);

            }else{
                $mensaje = "Error al guardar la imagen";
            }

        }else{
            $servicio->update($requestData);
            $mensaje = "Actualizado correctamente";
        }

        return response()->json(['mensaje'=>$mensaje], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Servicio  $servicio
     * @return \Illuminate\Http\Response
     */
    public function destroy(Servicio $servicio)
    {
        //
    }
}
