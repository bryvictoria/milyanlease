<?php

namespace App\Database\Connectors;

use Illuminate\Database\Connectors\PostgresConnector;
use InvalidArgumentException;

class NeonPostgresConnector extends PostgresConnector
{
    protected function getDsn(array $config)
    {
        $dsn = parent::getDsn($config);
        $endpointId = $config['endpoint_id'] ?? null;

        if ($endpointId === null || $endpointId === '') {
            return $dsn;
        }

        if (! preg_match('/^[a-zA-Z0-9-]+$/', $endpointId)) {
            throw new InvalidArgumentException('The PostgreSQL endpoint ID has an invalid format.');
        }

        return $dsn.";options='endpoint={$endpointId}'";
    }
}
