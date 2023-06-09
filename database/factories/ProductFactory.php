<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            // 'id' => fake()->
            'product_uuid' => fake()->uuid(),
            'product_name' => fake()->unique()->name(),
            'category_id' => mt_rand(1,5),
            // 'merk_id' => mt_rand(1,5),
            'satuan_id' => mt_rand(1,5),
            'sub_category_id' => mt_rand(1,5),
            'supplier_id' => mt_rand(1,5),
        ];
    }
}
