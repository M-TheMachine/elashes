<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IsRootAdminSupervisorVendedor
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        // return $next($request);
        if (Auth::user() && (Auth::user()->rol == 'root' ||  Auth::user()->rol == 'admin' ||  Auth::user()->rol == 'supervisor' ||  Auth::user()->rol == 'secretario')) {
            return $next($request);
        }

        return redirect('home')->with('error','No tienes acceso');
    }
}
