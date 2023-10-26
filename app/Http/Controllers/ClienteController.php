<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use App\Models\Venta;
use Illuminate\Http\Request;
use Excel;
use App\Imports\ClientesImport;
use App\Exports\ClientesExport;
class ClienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $perPage = 25;
        $clientes = Cliente::withCount('ventas')
        ->where(function($query) use($request){
            $query->where('nombre','LIKE',"%$request->search%")
            ->orWhere('ci', 'LIKE', "%$request->search%")
            ->orWhere('celular', 'LIKE', "%$request->search%");
        })
        ->latest()
        ->paginate($perPage);
        foreach ($clientes as $key => $value) {
            $value->venta = Venta::where('cliente_id',$value->id)->orderBy('created_at','DESC')->first();
        }
        $data = array('data' => $clientes);
        return response()->json($data);
    }

    public function ventasCliente(Request $request)
    {
        $perPage = 25;
        $ventas = Venta::where('cliente_id',$request->id)
        ->whereHas('servicio', function($q) use ($request){
            $q->where('nombre','LIKE',"%$request->search%");
        })
        ->latest()
        ->paginate($perPage);
        foreach ($ventas as $key => $value) {
            $value->servicio;
            $value->user;
            $value->sucursal;
        }
        $data = array('data' => $ventas);
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
            'ci' => 'required',
        ];
        $this->validate($request,$campos);
        $requestData = $request->all();
        Cliente::create($requestData);
        return response()->json(['mensaje'=>"Cliente registrado"], 200);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Cliente  $cliente
     * @return \Illuminate\Http\Response
     */
    public function show(Cliente $cliente)
    {
        foreach ($cliente->ventas as $key => $value) {
            $value->servicio;
            $value->user;
        }
        return response()->json(['data'=>$cliente], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Cliente  $cliente
     * @return \Illuminate\Http\Response
     */
    public function edit(Cliente $cliente)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Cliente  $cliente
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Cliente $cliente)
    {
        $campos=[
            'nombre' => 'required|string|max:100',
            'ci' => 'required',
        ];
        $this->validate($request,$campos);
        $requestData = $request->all();
        $cliente->update($requestData);
        return response()->json(['mensaje'=>'Cliente Actualizado'], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Cliente  $cliente
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cliente $cliente)
    {
        //
    }

    public function importcl(Request $request){
        if ($request->hasFile('clientes_excel')) {
            $file = $request->file('clientes_excel');
            $imported_data = Excel::import(new ClientesImport,$file);
            // $imported_data = Excel::import(new ClientesImport,$file->getRealPath());
                            // ->noHeading()
                            // ->skipRows(1)
                            // ->get()
                            // ->toArray();
            // dd($imported_data);
            return response()->json(['mensaje'=>"Clientes importados correctamente"], 200);
        }

    }

    public function exportClientes()
    {
        return Excel::download(new ClientesExport, 'clientes.xlsx');
    }
}
