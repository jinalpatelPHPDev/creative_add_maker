<?php

return [
    "environment" => "test",
    'envanto' => [
        'envanto_username' => env('ENVATO_USERNAME'),
        'envanto_code' => env('ENVATO_CODE'),
    ],
    'routes' => [
        'prefix' => env('API_KEY'),    
    ],
];
?>