<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateServiciosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('servicios', function (Blueprint $table) {
            $table->id();
            $table->string('nombre');
            $table->text('descripcion')->nullable();
            $table->string('imagen')->nullable();
            $table->float('precio', 8, 2);
            $table->float('comision', 8, 2);
            $table->string('codigo')->nullable();
            //$table->string('tecnica')->nullable();
            $table->boolean('promocion')->default(0);
            $table->boolean('extra')->default(0);
            $table->enum('estado',['habilitado','deshabilitado']);
            $table->foreignId('categoria_id')->constrained()->nullable();
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
        Schema::dropIfExists('servicios');
    }
}
