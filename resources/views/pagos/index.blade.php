@extends('layouts.app')

@section('content')
{{-- <div class="container">
    <div class="row justify-content-center"> --}}
        <pagos-component susursal="{{ $susursal }}" user="{{ auth()->user() }}"></pagos-component>
    {{-- </div>
</div> --}}
@endsection
