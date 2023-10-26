<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Venta;
use App\Models\Categoria;
class Servicio extends Model
{
    use HasFactory, SoftDeletes;

    protected $guarded = [];

    public function categoria()
    {
        return $this->belongsTo(Categoria::class);
    }

    public function ventas()
    {
        return $this->hasMany(Venta::class);
    }

    public function recordatorios()
    {
        return $this->hasMany(Recordatorio::class);
    }

}



