<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Shipment>
 */
class IssuingFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'issuing_uuid' => fake()->uuid(),
            'issuing_date' => fake()->dateTime(),
            'user_id' => mt_rand(1,5) ,
            // 'Issuin'
        ];
    }
}
