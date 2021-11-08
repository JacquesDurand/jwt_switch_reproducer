<?php

namespace App\DataFixtures;

use App\Factory\UserFactory;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        UserFactory::new()->create(['email' => 'admin@test.com', 'password' => 'test']);
        UserFactory::new()->create(['email' => 'impersonnated@test.com', 'password' => 'toto']);

        $manager->flush();
    }
}
