<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecordatorioVentasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recordatorio_ventas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('recordatorio_id')->constrained();
            $table->foreignId('venta_id')->constrained();
            $table->date('fecha');
            $table->boolean('recordado');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('recordatorio_ventas');
    }
}
