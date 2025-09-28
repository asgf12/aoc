#! /usr/bin/env pwsh

$data = get-content -raw $args
$data = $data.split("`n") | foreach {$_.trim()}

foreach ($line in $data) {
    $arr = @()
    $line.split(" ") | foreach {$arr += $_}
}


