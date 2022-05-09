<?php

namespace App\Http\Controllers;
use App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\User;


class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getAllUsers()
    {
        if($this->checkAdmin()){
            return User::all();
        }
        return response()->json(['error' => 'Unauthorized'], 401);
        
    }

    public function getUserById(Request $request)
    {
        if($this->checkAdmin() || $request->id == auth()->user()->id){
            return User::find($request->id);
        }
        return User::find($request->id)->get('email','amount');
    }
    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function editUser(Request $request)
    {
        $email = $request->email;
        $password = $request->password;
        $amount = $request->amount;
        $updated_at = now();
        return User::find($request->id)->update(['email' => $email,'password' => $password,'amount' => $amount,'updated_at' => $updated_at]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function deleteUser(Request $request)
    {
        if($this->checkAdmin()){
            return User::find($request->id)->delete();;
        }
        
    }

    public function checkAdmin() {
        $payload = auth()->payload();
        return $payload['admin']==true;
    }
}
