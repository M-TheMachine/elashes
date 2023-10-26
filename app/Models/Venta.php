<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Detalle;
use App\Models\Cliente;
use App\Models\Sucursal;
use App\Models\Recordatorio;
class Venta extends Model
{
    use HasFactory,SoftDeletes;

    protected $guarded = [];

    public function servicio()
    {
        return $this->belongsTo(Servicio::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function cliente()
    {
        return $this->belongsTo(Cliente::class);
    }

    public function sucursal()
    {
        return $this->belongsTo(Sucursal::class);
    }

    public function recordatorios()
    {
        return $this->belongsToMany(Recordatorio::class, 'recordatorio_ventas');
    }

    public function recordar()
    {
        return $this->belongsToMany(Recordatorio::class, 'recordatorio_ventas')->withPivot('fecha', 'recordado')->wherePivot('recordado', 0);
    }

    public function recordado()
    {
        return $this->belongsToMany(Recordatorio::class, 'recordatorio_ventas')->wherePivot('recordado', 1);
    }

    public function tecnica()
    {
        return $this->belongsTo(Tecnica::class);
    }

}
