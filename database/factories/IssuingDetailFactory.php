<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ShipmentDetail>
 */
class IssuingDetailFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'issuingdetail_uuid' => fake()->uuid(),
            'issuing_id' => mt_rand(1,5),
            'product_id' => mt_rand(1,5),
        ];
    }
}
