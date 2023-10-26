<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use Illuminate\Http\Request;
use Image;
use File;
class CategoriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $perPage = 25;
        // $categorias = Categoria::whereNull('categoria_id')->where(function($query) use($request){
        $categorias = Categoria::where(function($query) use($request){
            $query->where('nombre','LIKE',"%$request->search%");
        })->latest()->paginate($perPage);
        foreach ($categorias as $key => $value) {
            if ($value->imagen) {
                $value->imagen = asset($value->imagen);
            }
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
        // dd($categorias);
        $data = array('data' => $categorias);
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
            // 'imagen' => 'required'
        ]);

        $requestData = $request->all();
        if($request->hasFile('imagen')){
            $image = Image::make($request->file('imagen'));
            $extension = $request->file('imagen')->getClientOriginalExtension();
            $fileName = rand(0,10)."-".date('his')."-".rand(0,10).".".$extension;
            $path  = 'img/Categoria';
            if (!file_exists($path)) {
                mkdir($path, 0777, true);
            }
            $img = $path.'/'.$fileName;
            if($image->save($img)) {
                // $requestData['imagen'] = $img;
                $requestData['imagen'] = $img;
                Categoria::create($requestData);
                $mensaje = "Registrado correctamente";
            }else{
                $mensaje = "Error al guardar la imagen";
            }

        }else{

            Categoria::create($requestData);
            $mensaje = "Registrado correctamente";
        }

        return response()->json(['mensaje'=>$mensaje], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Categoria  $categoria
     * @return \Illuminate\Http\Response
     */
    public function show(Categoria $categoria)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Categoria  $categoria
     * @return \Illuminate\Http\Response
     */
    public function edit(Categoria $categoria)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Categoria  $categoria
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $categoria = Categoria::find($id);
        $this->validate($request, [
            'nombre' => 'required',
        ]);

        $requestData = $request->all();
        $mensaje = "Actualizado correctamente";
        if($request->hasFile('imagen')){
            $image = Image::make($request->file('imagen'));
            $extension = $request->file('imagen')->getClientOriginalExtension();
            $fileName = rand(0,10)."-".date('his')."-".rand(0,10).".".$extension;
            $path  = 'img/Categoria';
            if (!file_exists($path)) {
                mkdir($path, 0777, true);
            }
            $img = $path.'/'.$fileName;
            if($image->save($img)) {
                $archivo_antiguo = $categoria->imagen;
                $requestData['imagen'] = $img;
                $mensaje = "Actualizado correctamente :3";
                if ($archivo_antiguo != '' && !File::delete($archivo_antiguo)) {
                    $mensaje = "Actualizado. error al eliminar la imagen";
                }
                $categoria->update($requestData);

            }else{
                $mensaje = "Error al guardar la imagen";
            }

        }else{
            $categoria->update($requestData);
            $mensaje = "Actualizado correctamente";
        }

        return response()->json(['mensaje'=>$mensaje], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Categoria  $categoria
     * @return \Illuminate\Http\Response
     */
    public function destroy(Categoria $categoria)
    {
        //
    }
}
