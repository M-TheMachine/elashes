@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <clientes-detalle-component id="{{ $id }}"></clientes-detalle-component>
    </div>
</div>
@endsection
