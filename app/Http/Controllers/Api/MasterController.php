<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\Satuan;
use App\Models\Stock;
use App\Models\SubCategory;
use Illuminate\Http\Request;

class MasterController extends Controller
{
    public function store(Request $request)
    {
        try {
            
            $data = $request->validate([
                'category_name' => 'required|unique:categories',
                'subcategory_name' => 'required|unique:sub_categories',
                'product_name' => 'required|unique:products',
                'jumlah' => 'required',
                'satuan_name' => 'required|unique:satuans',
            ]);

            if($data) {
                $category = Category::create([
                    'category_uuid' => fake()->uuid(),
                    'category_name' => $data['category_name']
                ]);
                
                $subCategory= SubCategory::create([
                    'subcategory_uuid' => fake()->uuid(),
                    'subcategory_name' => $data['subcategory_name']
                ]);
                
                $satuan = Satuan::create([
                    'satuan_uuid' => fake()->uuid(),
                    'satuan_name' => $data['satuan_name']
                ]);
    
                $p = Product::create([
                    'product_uuid' => fake()->uuid(),
                    'product_name' => $data['product_name'],
                    'category_id' => $category->id,
                    'sub_category_id' => $subCategory->id,
                    // 'merk_id' => 1,
                    'satuan_id' => $satuan->id,
                    'supplier_id' => 1,
                ]);
    
                $stock = Stock::create([
                    'stock_uuid' => fake()->uuid(),
                    'stock_value' => $data['jumlah'],
                    'product_id' => $p->id
                ]);
                return response()->json([
                    'product' => $p,
                    'category' => $category,
                    'sub_cat' => $subCategory,
                    'satuan' => $satuan,
                    'stock' => $stock,
                ]);
            }
        } catch (\Throwable $e) {
            return response(['error' => $e->getMessage()],500);
        }
    }
}
