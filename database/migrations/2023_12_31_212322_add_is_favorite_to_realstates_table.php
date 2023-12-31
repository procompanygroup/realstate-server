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
        Schema::table('realstates', function (Blueprint $table) {
            $table->integer('isFavorite')->after('userid'); 
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('realstates', function (Blueprint $table) {
         
         $table->dropColum('isFavorite');
      
     
        });
    }
};
