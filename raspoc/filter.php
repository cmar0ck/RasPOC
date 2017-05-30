<?php

function parse($id, array $list = [])
{
    $matches = [];
    $matched = false;

    foreach ($list as $line)
    {
        // found address-line
        if (strpos($line, 'Address:') !== false)
        {
            // found matching id, mark as matched and continue to next line
            //if (strpos($line, 'Address: ' . $id) !== false)
            if (preg_match('/(Address:)([\s]*)(' . $id . ' )/', $line) === 1)
            {
                $matched = true;
                $matches[] = $line;
                continue;
            }
            // unmark and save this line
            else
            {
                $matched = false;
            }
        }
        // all other lines
        else
        {
            // if matched then continue to next line
            if ($matched)
            {
                $matches[] = $line;
                continue;
            }
            // if not matched then save this line
            else
            {
                $matched = false;
            }
        }
    }

    return $matches;
}

if ($argc < 3)
{
    echo 'usage: ' . $argv[0] . ' <id-file> <log-file>';
    die();
}

$files = array_slice($argv, 1);

foreach ($files as $file)
{
    if (!file_exists($file))
    {
        echo $file . ' not found!';
        die();
    }
}

$ids = file($files[0]);
$log = file($files[1]);

$matches = '';

foreach ($ids as $id)
{
    $id = trim($id);

    if ($id !== '')
    {
        $matches .= implode('', parse($id, $log));
    }
}

echo $matches;