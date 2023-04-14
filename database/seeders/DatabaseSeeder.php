<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\Category;
use App\Models\Customer;
use App\Models\Issuing;
use App\Models\IssuingDetail;
use App\Models\Merk;
use App\Models\Product;
use App\Models\Receiving;
use App\Models\ReceivingDetail;
use App\Models\Satuan;
use App\Models\Stock;
use App\Models\SubCategory;
use App\Models\Supplier;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        Product::factory(5)->create();
        Category::factory(5)->create();
        Merk::factory(5)->create(); 
        Satuan::factory(5)->create();
        SubCategory::factory(5)->create();
        Supplier::factory(5)->create();
        Stock::factory(5)->create();
        Issuing::factory(5)->create();
        IssuingDetail::factory(5)->create();
        Receiving::factory(5)->create();
        ReceivingDetail::factory(5)->create();
        User::factory(5)->create();
        // Customer::factory(5)->create();
        
        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}
