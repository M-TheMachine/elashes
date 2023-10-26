<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVentasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ventas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cliente_id')->constrained()->nullable();
            $table->foreignId('sucursal_id')->constrained()->nullable();
            $table->foreignId('servicio_id')->constrained();
            $table->foreignId('tecnica_id')->constrained()->nullable();
            $table->foreignId('user_id')->constrained()->nullable();
            $table->float('precio', 8, 2);
            $table->integer('cantidad');
            // $table->float('total', 8, 2);
            $table->float('subtotal', 8, 2);
            $table->float('descuento', 8, 2);
            $table->float('total', 8, 2);
            $table->float('comision', 8, 2);
            $table->float('caja', 8, 2);
            $table->text('descripcion')->nullable();
            $table->enum('estado',['aceptado','anulado']);
            $table->enum('pago',['efectivo','tarjeta','transferencia']);
            $table->boolean('facturado')->nullable();
            $table->softDeletes();
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
        Schema::dropIfExists('ventas');
    }
}
