#!/usr/bin/php

<?php

$connection = new \PDO(
    'pgsql:host=localhost;port=5432;dbname=github_events',
    'super_admin',
    '12345'
);

$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

function createRawEvents(){
    global $connection;
    deleteRawEvents();
    $sql = "CREATE TABLE raw_events(json_data jsonb)";
    $statement = $connection->prepare($sql);
    $statement->execute();
}

function deleteRawEvents(){
    global $connection;
    $sql = "DROP TABLE IF EXISTS raw_events";
    $statement = $connection->prepare($sql);
    $statement->execute();
}

function addJsons(array $buffer)
{
    global $connection;

    $values = implode('), (', array_fill(0, count($buffer), '?'));

    $sql = "INSERT INTO raw_events(json_data) VALUES (".$values.")";

    $statement = $connection->prepare($sql);
    $statement->execute($buffer);
}

function addingDone(){
    global $connection;
    $sql = "SELECT json_data from raw_events limit 2";

    $statement = $connection->prepare($sql);
    $statement->execute();
    $results = $statement->fetchAll(PDO::FETCH_COLUMN);
    foreach ($results as $result){
        echo $result;
    }
}
//$jsonFilePath = sprintf('%s/../resources/2018-11-02-2.json', __DIR__);
$jsonFilePath = sprintf('%s/../resources/2019-05-28-14.json', __DIR__);

$handle = fopen($jsonFilePath, 'r');

$maxLinePerBatch = 1000;
$buffer = [];

createRawEvents();

while (false !== $line = fgets($handle)) {
    $buffer[] = $line;
    if (count($buffer) >= $maxLinePerBatch) {
        addJsons($buffer);
        $buffer = [];
    }
}

echo "Data save in database";
addingDone();

if (!empty($buffer)) {
    addJsons($buffer);
}