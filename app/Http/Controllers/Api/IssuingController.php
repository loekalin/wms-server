<?php

namespace App\Http\Controllers\Api;

use App\Models\Stock;
use App\Models\Issuing;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\IssuingDetail;
use Tymon\JWTAuth\Claims\Issuer;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class IssuingController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Issuing::join('issuing_details as isd', 'issuings.id', '=' , 'isd.issuing_id')
        ->join('products as p', 'isd.product_id' , '=' , 'p.id')
        ->join('sub_categories as sc', 'p.sub_category_id' , '=' , 'sc.id')
        ->join('satuans as st', 'p.satuan_id' , '=' , 'st.id')
        ->orderBy('issuings.created_at' , 'DESC')
        ->select('p.product_name as name' , 'sc.subcategory_name as sub_category' , 'issuings.issuing_uuid as uuid', 'st.satuan_name as satuan', 'issuings.issuing_date as date')
        ->paginate(10);
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
        try {
            $data = $request->validate([
                'category' => 'required',
                'sub_category' => 'required',
                'product' => 'required',
                'jumlah' => 'required',
                'satuan' => 'required',
                'issuing_date' => 'required|date',
            ]);

            $issuing = Issuing::create([
                'issuing_uuid' => fake()->uuid(),
                'issuing_date' => $data['issuing_date'],
                'user_id' => 2
            ]);

            $issuingDetail = IssuingDetail::create([
                'issuingdetail_uuid' => fake()->uuid(),
                'issuing_id' => $issuing->id,
                'product_id' => $data['product']
            ]);

            Stock::where('product_id', $data['product'])->update([
                'stock_value' => DB::raw('stock_value - '.$data['jumlah'])
            ]);

            return response()->json([
                'data' => $issuing,
                'detail' => $issuingDetail
            ]);
        } catch (\Throwable $e) {
            return response(['error' => $e->getMessage()],500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Issuing $issuing)
    {
        try {
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

    public function edit(Issuing $issuing)
    {
        $data =  Issuing::join('issuing_details as d', 'issuings.id', '=', 'd.issuing_id')
            ->join('products AS p', 'p.id', '=' , 'd.product_id')
            ->join('suppliers AS s', 's.id', '=' , 'p.supplier_id')
            ->join('sub_categories AS sc', 'p.sub_category_id', '=' , 'sc.id')
            ->join('categories AS c', 'p.category_id', '=' , 'c.id')
            ->join('satuans AS st', 'p.satuan_id', '=' , 'st.id')
            ->join('stocks AS stk', 'p.id', '=' , 'stk.product_id')
            ->select( 'p.product_name AS product', 'stk.stock_value AS value' ,'st.satuan_name AS satuan','p.product_uuid AS uuid',  's.supplier_name AS supplier', 'sc.subcategory_name AS sub_category', 'c.category_name AS category' )
            ->where('issuings.issuing_uuid', $issuing->issuing_uuid)
            ->get(); 
        
            return response($data,200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Issuing $issuing)
    {
        try {
            $data = $request->validate([
                'product' => 'required',
                'jumlah' => 'required',
                'jumlah_lama' => 'required'
            ]);
    
            $issuingDetail = IssuingDetail::where('issuing_id', $issuing->id)->update([
                'product_id' => $data['product']
            ]);
            
            $stock = Stock::where('product_id', $data['product'])->update([
                'stock_value' => DB::raw('stock_value + '.$data['jumlah_lama'] . ' - '. $data['jumlah'])
            ]);
    
            return response()->json([
                'data' => $issuing,
                'detail' => $issuingDetail,
                'stock' => $stock
            ]);
        } catch (\Throwable $e) {
            return response(['error' => $e->getMessage()],500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Issuing $issuing)
    {
        try {
            $issuing->delete();
            IssuingDetail::where('issuing_id', $issuing->id)->delete();
            return response()->json([
                'message' => 'Data berhasil dihapus'
            ]);
        } catch (\Throwable $e) {
            return response(['error' => $e->getMessage()],500);
        }
    }
}
