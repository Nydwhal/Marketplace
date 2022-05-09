<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Product;
use RuntimeException;
use App\Http\Controllers;

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
        $owner_id = auth()->user()->id;
        $image = $request->image;
        return Product::create(['label' => $label, 'description' => $description, 'initial_price' => $initial_price, 'current_price' => $current_price, 'start_date' => $start_date, 'end_date' => $end_date, 'state' => $state, 'owner_id' => $owner_id, 'client_id' => $owner_id, 'image' => $image]); 
    }

    public function editProduct(Request $request)
    {
        $user_id = Product::find($request->id)->owner_id;
        $client_id = auth()->user()->id;
        if ($user_id!= $client_id) {
            return response()->json([
                'error' => 'You are not allowed to edit product of other user'
            ], 401);
        }else{
            return Product::find($request->id)->update($request->all());
        }
    }

    public function bidProduct(Request $request)
    {
        $product = Product::find($request->id);
        $user_id = $product->owner_id;
        $client_id = auth()->user()->id;

        if ($product->state == 'sold'){
            return response()->json([
                'error' => 'Product is sold'
            ], 401);
        }
        if ($user_id == $client_id) {
            throw new RuntimeException('You are not allowed to bid your own product');
        }

        $new_price = $request -> new_price;
        if ($new_price <= Product::find($request->id)->current_price) {
            throw new RuntimeException("The price proposed can't be equal or lower than the last price proposed");
        }

        $product = Product::find($request->id);
        $product->update(['current_price' => $new_price]);
        return $product;
    }


    public function deleteProduct(Request $request)
    {
        $user_id = Product::find($request->id)->owner_id;
        $client_id = auth()->user()->id;
        if ($user_id != $client_id) {
            throw new RuntimeException('You are not allowed to delete products of other users');
        }

        $id = $request->id;
        return Product::find($id)->delete();
    }

    public function productSold(Request $request)
    {
        $product = Product::find($request->id);

        if ($product->state == 'sold') {
            throw new RuntimeException('The product is already sold');
        }
        $state = 'sold';
        $product->update(['state' => $state]);
        return $product;
    }
}
