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
                'name' => 'James',
                'email' => 'james@gmail.com',
                'password' => 'jamespwd',
                'amount' => 1000,
            ], [
                'name' => Str::random(10),
                'email' => Str::random(10) . '@gmail.com',
                'password' => 'userpwd',
                'amount' => rand(0, 1000),
            ]]
        );
    }
}
