@extends('layouts.app')

@section('content')
{{-- <div class="container">
    <div class="row justify-content-center"> --}}
        <sucursales-component usuario="{{Auth::user()}}"></sucursales-component>
    {{-- </div>
</div> --}}
@endsection
