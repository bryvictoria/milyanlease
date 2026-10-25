<?php

ini_set('display_errors', 'Off');
ini_set('display_startup_errors', 'Off');
error_reporting(0);

$runtimeDirectory = sys_get_temp_dir();
$cacheDirectory = $runtimeDirectory;

if (DIRECTORY_SEPARATOR === '\\') {
    $runtimeDirectory = __DIR__.'/../storage/framework/testing';

    if (! is_dir($runtimeDirectory) && ! mkdir($runtimeDirectory, 0775, true) && ! is_dir($runtimeDirectory)) {
        throw new RuntimeException('Unable to create the local runtime directory.');
    }

    $cacheDirectory = 'storage/framework/testing';
}

$viewDirectory = $runtimeDirectory.'/views';

if (! is_dir($viewDirectory) && ! mkdir($viewDirectory, 0775, true) && ! is_dir($viewDirectory)) {
    throw new RuntimeException('Unable to create the compiled view directory.');
}

$viewCompiledPath = DIRECTORY_SEPARATOR === '\\'
    ? $cacheDirectory.'/views'
    : $viewDirectory;

$databasePath = $runtimeDirectory.'/milyanlease-demo.sqlite';
$databaseTemplate = __DIR__.'/../database/database.sqlite';

$lock = fopen($runtimeDirectory.'/milyanlease-demo.lock', 'c');

if ($lock === false || ! flock($lock, LOCK_EX)) {
    throw new RuntimeException('Unable to lock the demo database initialization.');
}

try {
    if (! is_file($databasePath)) {
        if (! is_file($databaseTemplate)) {
            throw new RuntimeException('The bundled demo database is missing.');
        }

        $temporaryDatabasePath = $databasePath.'.'.bin2hex(random_bytes(8)).'.tmp';

        if (! copy($databaseTemplate, $temporaryDatabasePath) || ! rename($temporaryDatabasePath, $databasePath)) {
            @unlink($temporaryDatabasePath);

            throw new RuntimeException('Unable to initialize the demo database.');
        }
    }
} finally {
    flock($lock, LOCK_UN);
    fclose($lock);
}

foreach ([
    'APP_SERVICES_CACHE' => $cacheDirectory.'/milyanlease-services.php',
    'APP_PACKAGES_CACHE' => $cacheDirectory.'/milyanlease-packages.php',
    'VIEW_COMPILED_PATH' => $viewCompiledPath,
    'DB_CONNECTION' => 'sqlite',
    'DB_DATABASE' => $databasePath,
    'DATABASE_URL' => '',
    'DB_URL' => '',
    'SESSION_DRIVER' => 'cookie',
    'CACHE_DRIVER' => 'array',
] as $key => $path) {
    $_ENV[$key] = $path;
    $_SERVER[$key] = $path;
    putenv($key.'='.$path);
}

require __DIR__.'/../public/index.php';
