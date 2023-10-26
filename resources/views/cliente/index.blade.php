@extends('layouts.app')

@section('content')
{{-- <div class="container">
    <div class="row justify-content-center"> --}}
        <clientes-component usuario="{{Auth::user()}}"></clientes-component>
    {{-- </div>
</div> --}}
@endsection
