<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use RuntimeException;

class ProductController extends Controller
{
    public function index()
    {
        return Product::all();
    }

    public function addProduct(Request $request)
    {
        $label = $request->label;
        $description = $request->description;
        $initial_price = $request->initial_price;
        $current_price = $request->current_price;
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        $state = $request->state;
        $user_id = $request->user_id;
        return Product::create(['label' => $label, 'description' => $description, 'initial_price' => $initial_price, 'current_price' => $current_price, 'start_date' => $start_date, 'end_date' => $end_date, 'state' => $state, 'user_id' => $user_id]);
    }

    public function editProduct(Request $request)
    {
        return Product::find($request->id)->update($request->all());
    }
    
    public function bidProduct(Request $request)
    {
        $new_price = $request -> new_price;
        if ($new_price <= Product::find($request->id)->current_price) {
            throw new RuntimeException("The price proposed can't be lower than the last current price");
        }
        return Product::find($request->id)->update(['current_price' => $new_price]);
    }


    public function deleteProduct(Request $request)
    {
        $id = $request->id;
        return Product::find($id)->delete();
    }
}
