<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Order>
 */
class ReceivingFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'Receiving_uuid' => fake()->uuid(),
            'Receiving_date' => fake()->dateTime(),
            'customer_id' => mt_rand(1,5),
        ];
    }
}
