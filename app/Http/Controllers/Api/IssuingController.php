<?php

namespace App\Http\Controllers\Api;

use App\Models\Issuing;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IssuingController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Issuing::latest()->get();
        return response($data,200);
    }

    public function create()
    {
        return response([
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
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Issuing $issuing)
    {
        try {
            // dd($id);
            // $data = Issuing::join('issuing_details as d', 'issuings.id', '=', 'd.issuing_id')
            // ->join('products AS p', 'p.id', '=' , 'd.product_id')
            // ->join('suppliers AS s', 's.id', '=' , 'p.supplier_id')
            // ->join('sub_categories AS sc', 'p.sub_category_id', '=' , 'sc.id')
            // ->join('categories AS c', 'p.category_id', '=' , 'c.id')
            // ->join('satuans AS st', 'p.satuan_id', '=' , 'st.id')
            // ->join('stocks AS stk', 'p.id', '=' , 'stk.product_id')
            // ->select('p.product_name AS product', 'stk.stock_value AS value' ,'st.satuan_name AS satuan','p.product_uuid AS uuid')
            // ->where('issuings.id', $id)
            // ->get();
            
            $data = Issuing::join('issuing_details as d', 'issuings.id', '=', 'd.issuing_id')
            ->join('products AS p', 'p.id', '=' , 'd.product_id')
            ->join('suppliers AS s', 's.id', '=' , 'p.supplier_id')
            ->join('sub_categories AS sc', 'p.sub_category_id', '=' , 'sc.id')
            ->join('categories AS c', 'p.category_id', '=' , 'c.id')
            ->join('satuans AS st', 'p.satuan_id', '=' , 'st.id')
            ->join('stocks AS stk', 'p.id', '=' , 'stk.product_id')
            ->select('p.product_name AS product', 'stk.stock_value AS value' ,'st.satuan_name AS satuan','p.product_uuid AS uuid',  's.supplier_name AS supplier', 'sc.subcategory_name AS sub_category', 'c.category_name AS category')
            ->where('issuings.id', $issuing->id)
            ->get();

            return response()->json($data);
        } catch (\Throwable $e) {
            return response(['error' => $e->getMessage()],500);        
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Issuing $issuing)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Issuing $issuing)
    {
        //
    }
}
