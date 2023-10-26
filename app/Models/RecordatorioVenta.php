<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Venta;
use App\Models\Recordatorio;
class RecordatorioVenta extends Model
{
    use HasFactory;

    public function venta()
    {
        return $this->belongsTo(Venta::class);
    }
    public function recordatorio()
    {
        return $this->belongsTo(Recordatorio::class);
    }
}
