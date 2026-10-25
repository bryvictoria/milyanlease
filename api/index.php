<?php

$runtimeCache = sys_get_temp_dir();

foreach ([
    'APP_SERVICES_CACHE' => $runtimeCache.'/milyanlease-services.php',
    'APP_PACKAGES_CACHE' => $runtimeCache.'/milyanlease-packages.php',
] as $key => $path) {
    $_ENV[$key] = $path;
    $_SERVER[$key] = $path;
    putenv($key.'='.$path);
}

require __DIR__.'/../public/index.php';
