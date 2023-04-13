<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\OrderDetail>
 */
class ReceivingDetailFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'ReceivingDetail_uuid' => fake()->uuid(),
            'receiving_id' => mt_rand(1,5),
            'product_id' => mt_rand(1,5)
        ];
    }
}
