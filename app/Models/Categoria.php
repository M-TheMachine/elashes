<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Servicio;
class Categoria extends Model
{
    use HasFactory,SoftDeletes;

    protected $guarded = [];


    // public function categorias()
    // {
    //     return $this->hasMany(Categoria::class);
    // }

    public function categoria()
    {
        return $this->belongsTo(Categoria::class);
    }

    public function categorias()
    {
        return $this->hasMany(Categoria::class)->with('categorias');
    }

    public function servicios()
    {
        return $this->hasMany(Servicio::class);
    }
}
