<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Tecnica extends Model
{
    use HasFactory, SoftDeletes;

    protected $guarded = [];

    public function categoria()
    {
        return $this->belongsTo(Categoria::class);
        // return $this->hasMany(User::class);
    }

    public function ventas()
    {
        return $this->hasMany(Venta::class);
    }

}
