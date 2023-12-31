<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('realstates', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable() ;
            $table->string('desc')->nullable() ;
            $table->string('realmodel')->nullable() ;
            $table->string('periodtime')->nullable() ;
            $table->string('price')->nullable() ;
            $table->string('location')->nullable() ;
            $table->string('image')->nullable() ;
            $table->string('owner')->nullable() ;
            $table->integer('userid')->nullable() ;
           // $table->integer('isFavorite')->nullable() ;
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('realstates');
    }
};
