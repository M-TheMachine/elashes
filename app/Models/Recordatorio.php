<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Venta;
class Recordatorio extends Model
{
    use HasFactory,SoftDeletes;

    protected $guarded = [];

    public function servicio()
    {
        return $this->belongsTo(Servicio::class);
    }

    public function ventas()
    {
        return $this->belongsToMany(Venta::class, 'recordatorio_ventas');
    }
}
