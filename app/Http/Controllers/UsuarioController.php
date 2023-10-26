<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Venta;
use App\Models\Sucursal;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Hash;

class UsuarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $perPage = 25;
        $datos = User::withCount('ventas')->where(function($query) use($request){
            $query->where('nombre','LIKE',"%$request->search%")
            ->orWhere('ci', 'LIKE', "%$request->search%")
            ->orWhere('celular', 'LIKE', "%$request->search%")
            ->orWhere('username', 'LIKE', "%$request->search%")
            ->orWhere('email', 'LIKE', "%$request->search%")
            ->orWhere('rol', 'LIKE', "%$request->search%");
        })
        ->where('rol','<>','root')
        ->latest()->paginate($perPage);
        foreach ($datos as $key => $value) {
            $value->sucursals;
            foreach ($value->ventas as $key => $value2) {
                $value2->servicio;
            }
        }
        $data = array('data' => $datos);
        return response()->json($data);
    }

    public function getserviciosusuario(Request $request)
    {
        $perPage = 25;
        $datos = Venta::where('user_id',$request->id)
        ->where(function($query) use($request){
            if($request->search){
                $query->whereHas('cliente', function($q) use ($request){
                    $q->where('nombre','LIKE',"%$request->search%");
                })
                ->orWhereHas('servicio', function($q) use ($request){
                    $q->where('nombre','LIKE',"%$request->search%");
                });
            }
        })
        ->latest()->paginate($perPage);
        foreach ($datos as $key => $value) {
            $value->cliente;
            $value->servicio;
            $value->sucursal;
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
            //'sucursals' => ['required'],
            'nombre' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string', 'max:255','unique:users'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'rol' => ['required'],
        ];
        $this->validate($request,$campos);
        $requestData = $request->all();
        unset($requestData['password_confirmation']);
        // $sucursals_id = json_decode($requestData['sucursals']);
        // unset($requestData['sucursals']);
        $requestData['password'] = Hash::make($requestData['password']);
        $user = User::create($requestData);

        // foreach ($sucursals_id as $key => $value) {
        //     $user->sucursals()->attach($value->id);
        // }
        $sucursal = Sucursal::first();
        $user->sucursals()->attach($sucursal->id);
        // $user->sucursals()->saveMany($sucursals_id);
        return response()->json(['mensaje'=>"Usuario registrado"], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);
        $user->sucursals;
        return response()->json(['data'=>$user], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $user = User::find($id);
        $campos=[
            //'sucursals' => ['required'],
            'nombre' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string', 'max:255', Rule::unique('users', 'username')->ignore($user->id, 'id')],
            'email' => ['required', 'string', 'email', 'max:255', Rule::unique('users', 'email')->ignore($user->id, 'id')],
            'rol' => 'required',
        ];
        $this->validate($request,$campos);
        $requestData = $request->all();
        // $sucursals_id = json_decode($requestData['sucursals']);
        // unset($requestData['sucursals']);
        if($request->password){
            $campos=[
                'password' => ['required', 'string', 'min:8', 'confirmed'],
            ];
            $this->validate($request,$campos);
            unset($requestData['password_confirmation']);
            $requestData['password'] = Hash::make($requestData['password']);
        }else{
            unset($requestData['password_confirmation']);
            unset($requestData['password']);
        }
        $user->update($requestData);
        $user->sucursals()->detach();
        // foreach ($sucursals_id as $key => $value) {
        //     $user->sucursals()->attach($value->id);
        // }
        $sucursal = Sucursal::first();
        $user->sucursals()->attach($sucursal->id);
        // $user->sucursals()->saveMany($sucursals_id);

        return response()->json(['mensaje'=>'Usuario Actualizado'], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
