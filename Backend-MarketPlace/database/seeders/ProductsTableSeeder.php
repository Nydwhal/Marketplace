<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('products')->insert(
            [
                [
                    'label' => 'Iphone7',
                    'description' => 'Iphone de gamme moyenne',
                    "initial_price" => '277.00',
                    "current_price" => '277.00',
                    "start_date" => '2021-06-26',
                    "end_date" => '2021-07-26',
                    'state' => 'on_sale',
                    'owner_id' => '1',
                    'image' => 'image',
                    'client_id' => '2',
                ],
                [
                    'label' => 'Ps5',
                    'description' => 'Console next gen',
                    "initial_price" => '999.99',
                    "current_price" => '1203.00',
                    "start_date" => '2021-06-26',
                    "end_date" => '2021-07-10',
                    'state' => 'on_sale',
                    'owner_id' => '1',
                    'image' => 'image',
                    'client_id' => '1',
                ],
                [
                    'label' => 'Chaise',
                    'description' => 'Chaise en bois',
                    "initial_price" => '30.00',
                    "current_price" => '46.00',
                    "start_date" => '2022-01-26',
                    "end_date" => '2022-03-02',
                    'state' => 'sold',
                    'owner_id' => '1',
                    'image' => 'image',
                    'client_id' => '2',
                ],
            ]
        );
    }
}
