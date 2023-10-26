@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <usuarios-detalle-component id="{{ $id }}"></usuarios-detalle-component>
    </div>
</div>
@endsection
