<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Stock>
 */
class StockFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'Stock_uuid' => fake()->uuid(),
            'Stock_value' => mt_rand(1,1000),
            'product_id' => mt_rand(1,5)
        ];
    }
}
