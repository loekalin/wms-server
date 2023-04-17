<?php

namespace App\Http\Controllers\Api;

use App\Models\Satuan;
use App\Models\Product;
use App\Models\Category;
use App\Models\Receiving;
use App\Models\SubCategory;
use Illuminate\Http\Request;
use App\Models\ReceivingDetail;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class ReceivesController extends Controller
{
    public function index()
    {
        $data = Receiving::latest()->get();
        return response()->json($data,200);
    }

    public function create()
    {
        return response()->json([
                'product' => Product::join('categories AS c', 'products.category_id', '=' , 'c.id')
                            ->join('sub_categories AS sc', 'products.sub_category_id', '=' , 'sc.id')
                            ->join('satuans AS st', 'products.satuan_id', '=' , 'st.id')
                            ->get(['products.*', 'c.category_name AS category', 'sc.subcategory_name AS sub_category', 'st.satuan_name AS satuan'])
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $data = $request->validate([
                'category' => 'required',
                'sub_category' => 'required',
                'product' => 'required',
                'jumlah' => 'required',
                'satuan' => 'required',
                'receiving_date' => 'required|date',
            ]);

            $receiving = Receiving::create([
                'user_id' =>    1,
                'receiving_date' => $data['receiving_date'],
                'receiving_uuid' => fake()->uuid(),
            ]);
            
            $receiving_detail = ReceivingDetail::create([
                'receiving_id' => $receiving->id,
                'product_id' => $data['product'],
                'receivingdetail_uuid' => fake()->uuid(),
            ]);

            return response()->json([
                'receiving' => $receiving,
                'receiving_detail' => $receiving_detail
            ],200);
        } catch (\Throwable $e) {
            return response(['error' => $e->getMessage()],500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Receiving $receiving)
    {
        try {
            // $id = $receiving->id;
            // dd($receiving);
            $data = Receiving::join('receiving_details as d', 'receivings.id', '=', 'd.receiving_id')
            ->join('products AS p', 'p.id', '=' , 'd.product_id')
            ->join('suppliers AS s', 's.id', '=' , 'p.supplier_id')
            ->join('sub_categories AS sc', 'p.sub_category_id', '=' , 'sc.id')
            ->join('categories AS c', 'p.category_id', '=' , 'c.id')
            ->join('satuans AS st', 'p.satuan_id', '=' , 'st.id')
            ->join('stocks AS stk', 'p.id', '=' , 'stk.product_id')
            ->select( 'p.product_name AS product', 'stk.stock_value AS value' ,'st.satuan_name AS satuan','p.product_uuid AS uuid',  's.supplier_name AS supplier', 'sc.subcategory_name AS sub_category', 'c.category_name AS category' )
            ->where('receivings.id', $receiving->id)
            ->get();
            return response()->json($data);
        } catch (\Throwable $e) {
            return response(['error' => $e->getMessage()],500);
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, Receiving $receiving)
    {
        $data =  Receiving::join('receiving_details as d', 'receivings.id', '=', 'd.receiving_id')
            ->join('products AS p', 'p.id', '=' , 'd.product_id')
            ->join('suppliers AS s', 's.id', '=' , 'p.supplier_id')
            ->join('sub_categories AS sc', 'p.sub_category_id', '=' , 'sc.id')
            ->join('categories AS c', 'p.category_id', '=' , 'c.id')
            ->join('satuans AS st', 'p.satuan_id', '=' , 'st.id')
            ->join('stocks AS stk', 'p.id', '=' , 'stk.product_id')
            ->select( 'p.product_name AS product', 'stk.stock_value AS value' ,'st.satuan_name AS satuan','p.product_uuid AS uuid',  's.supplier_name AS supplier', 'sc.subcategory_name AS sub_category', 'c.category_name AS category' )
            ->where('receivings.receiving_uuid', $receiving->receiving_uuid)
            ->get(); 
        
        return response($data,200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Receiving $receiving)
    {
        try {
            $data = $request->validate([
                'category' => 'required',
                'sub_category' => 'required',
                'product' => 'required',
                'jumlah' => 'required',
                'satuan' => 'required',
                'receiving_date' => 'required|date',
            ]);

            


        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Receiving $receiving)
    {
        //
    }
}