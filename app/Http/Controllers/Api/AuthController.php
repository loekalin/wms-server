<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redis;

class AuthController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function login(Request $request)
    {
        try {
            $request->validate([
                'username' => 'required',
                'password' => 'required',
            ]);    
        } catch (\Throwable $e) {
            return response()->json(['error' => $e->getMessage()],500);
        }

        $credentials = $request->only('username', 'password');
        if(!$token = Auth::guard('api')->attempt($credentials)) {
            return response(['error' => 'Login Failed!'],500);
        }

        return response()->json([
            'data' => Auth::guard('api')->user(),
            'token' => $token
        ]);


        // try catch version
        // try {
        //     $credentials = $request->only('username' , 'password');
        //     $token = Auth::guard('api')->attempt($credentials);

        //     return response()->json([
        //         'data' => Auth::guard('api')->user(),
        //         'token' => $token
        //     ]);
        // } catch (\Throwable $e) {
        //     return response()->json([
        //         'error' => $e->getMessage()
        //     ]);
        // }
        
    }

//     public function logout(Request $request)
//     {
//             auth()->logout(true);
//             return response()->json(['message' => 'logout successful']);
//     }
}
