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
                'lastname' => 'Dupont',
                'firstname' => 'James',
                'email' => 'james@gmail.com',
                'password' => 'jamespwd',
                'telephone' => '0612345678',
                'adress' => '1 rue de la paix',
                'amount' => 1000,
            ], [
                'lastname' => Str::random(10),
                'firstname' => Str::random(10),
                'email' => Str::random(10) . '@gmail.com',
                'password' => 'userpwd',
                'telephone' => '0612345679',
                'adress' => '2 rue de la paix',
                'amount' => rand(0, 1000),
            ]]
        );
    }
}
