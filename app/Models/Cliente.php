<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Venta;
class Cliente extends Model
{
    use HasFactory, SoftDeletes;

    protected $guarded = [];

    public function ventas()
    {
        return $this->hasMany(Venta::class);
    }

    public function venta() {
        return $this->hasOne(Venta::class,'id','cliente_id')->latest();
    }

}
