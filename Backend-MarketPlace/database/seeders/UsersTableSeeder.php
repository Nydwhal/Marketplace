<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Ramsey\Uuid\Type\Integer;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert(
            [[
                'email' => 'admin@gmail.com',
                'password' => bcrypt('adminpwd'),
                'amount' => 1000,
                'created_at' => now(),
                'updated_at' => now(),
            ], [
                'email' => Str::random(10) . '@gmail.com',
                'password' => bcrypt('userpwd'),
                'amount' => rand(0, 1000),
                'created_at' => now(),
                'updated_at' => now(),
            ], [
                'email' => 'james@gmail.com',
                'password' => bcrypt('jamespwd'),
                'amount' => rand(0, 1000),
                'created_at' => now(),
                'updated_at' => now(),
            ]]
        );
    }
}