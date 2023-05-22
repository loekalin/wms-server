<?php

namespace App\Http\Controllers\Api;

use App\Enums\UserRoleEnum;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class MasterUserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = User::latest()->get();
        return response($data,200);
    }

    /**c
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $validatedData = $request->validate([
                'username' => 'required|unique:users',
                'role' => 'required',
                'password' => 'required',
            ]);

            $hashedPassword = Hash::make($validatedData['password']);

            $user = User::create([
                'user_uuid' => fake()->uuid(),
                'username' => $validatedData['username'],
                'role' => $validatedData['role'],
                'password' => $hashedPassword
            ]);

            return response($user,200);
        } catch (\Throwable $e) {
            return response(['error' => $e->getMessage()], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $user)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $user)
    {
        //
    }
}
