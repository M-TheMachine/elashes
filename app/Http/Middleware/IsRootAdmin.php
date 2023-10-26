<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IsRootAdmin
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
        if (Auth::user() && (Auth::user()->rol == 'root' ||  Auth::user()->rol == 'admin')) {
            return $next($request);
        }

        return redirect('home')->with('error','No tienes acceso');
    }
}
