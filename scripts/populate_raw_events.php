#!/usr/bin/php

<?php

$connection = new \PDO(
    'pgsql:host=localhost;port=5432;dbname=github_events',
    'postgres'
);

$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
function dropRawEvents(){
    global $connection;
    $sql = "DROP TABLE 'raw_events'";
    $statement = $connection->prepare($sql);
    $statement->execute();
}

function createRawEvents(){
    dropRawEvents();
    $sql = "CREATE TABLE 'raw_events'(json_data jsonb)";

    $statement = $connection->prepare($sql);
    $statement->execute();
}

function addJsons(array $buffer)
{
    global $connection;

    $values = implode('), (', array_fill(0, count($buffer), '?'));

    $sql = "INSERT INTO event_raw(json_data) VALUES (".$values.")";

    $statement = $connection->prepare($sql);
    $statement->execute($buffer);
}

$jsonFilePath = sprintf('%s/../resources/2018-11-02-2.json', __DIR__);

$handle = fopen($jsonFilePath, 'r');

$maxLinePerBatch = 10000;
$buffer = [];

createRawEvent();

while (false !== $line = fgets($handle)) {
    $buffer[] = $line;
    if (count($buffer) >= $maxLinePerBatch) {
        addJsons($buffer);
        $buffer = [];
    }
}

if (!empty($buffer)) {
    addJsons($buffer);
}