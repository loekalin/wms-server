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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->uuid('product_uuid')->unique();
            $table->string('product_name',50)->unique();
            $table->foreignId('category_id');
            // $table->foreignId('merk_id');
            $table->foreignId('satuan_id');
            $table->foreignId('sub_category_id');
            $table->foreignId('supplier_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
