<?php

require_once 'vendor/autoload.php';

$faker = Faker\Factory::create('fr_FR');

require 'C:\Users\samih\Documents\B2 projectSQL\db.php';




$pdo->exec("ALTER TABLE `adresses` AUTO_INCREMENT=1");
$pdo->exec("ALTER TABLE `carts` AUTO_INCREMENT=1");
$pdo->exec("ALTER TABLE `commands` AUTO_INCREMENT=1");
$pdo->exec("ALTER TABLE `invoices` AUTO_INCREMENT=1");
$pdo->exec("ALTER TABLE `payments` AUTO_INCREMENT=1");
$pdo->exec("ALTER TABLE `photos` AUTO_INCREMENT=1");
$pdo->exec("ALTER TABLE `products` AUTO_INCREMENT=1");
$pdo->exec("ALTER TABLE `products_cart` AUTO_INCREMENT=1");
$pdo->exec("ALTER TABLE `users` AUTO_INCREMENT=1");





for ($i = 1; $i < 10; $i++) {
   $blob = "0";

   
   for ($j = 0; $j < 100; $j++) {
         $bit = $faker->numberBetween($min = 0, $max = 1);
         $blob = $blob. $bit;
   };

   $date = $faker->dateTimeBetween($startDate = '-10 years', $endDate = 'now', $timezone = null)->format('Y-m-d H:i:s');

   
   $password = password_hash($faker->password, PASSWORD_BCRYPT);

   $pdo->exec("INSERT INTO users (last_name, first_name, age, email, password)
                  VALUES ('{$faker->lastName}', '{$faker->firstName($gender = 'male'|'female')}', '{$faker->numberBetween($min = 18, $max = 80)}',  '{$faker->email}', '{$password}');
               ");

   $pdo->exec("INSERT INTO adresses (adress, user_id)
                  VALUES ('{$faker->address}', '$i');
               ");

   $pdo->exec("INSERT INTO products (product_name, quantity, price)
                  VALUES ('{$faker->word}', '{$faker->numberBetween($min = 0, $max = 10000)}', '{$faker->randomFloat($nbMaxDecimals = 2, $min = 1, $max = 5000)}');
               ");

   $pdo->exec("INSERT INTO carts (user_id, creation_date, total_price)
                  VALUES ('$i', '$date',  '{$faker->randomFloat($nbMaxDecimals = 2, $min = 0, $max = 5000)}');
               ");

   $pdo->exec("INSERT INTO products_cart (cart_id, product_id, quantity)
                  VALUES ('$i', '$i', '{$faker->numberBetween($min = 1, $max = 10)}');
               ");

   $pdo->exec("INSERT INTO commands (cart_id, creation_date, total_price)
                  VALUES ('$i', '$date',  '{$faker->randomFloat($nbMaxDecimals = 2, $min = 1, $max = 5000)}');
               ");
      
   $pdo->exec("INSERT INTO payments (user_id, payment_method, card_number, iban)
                  VALUES ('$i', '{$faker->creditCardType}',  '{$faker->creditCardNumber}',  '{$faker->bankAccountNumber}');
               ");
   
   $pdo->exec("INSERT INTO photos (type, entity_id, image_data)
                  VALUES ('{$faker->word}','$i', '$blob');
               ");
               
   $pdo->exec("INSERT INTO invoices (command_id, payment_id, user_id, date, total_price)
                  VALUES ('$i','$i','$i', '$date',  '{$faker->randomFloat($nbMaxDecimals = 2, $min = 1, $max = 5000)}');
               ");



}


echo 'db filled';
