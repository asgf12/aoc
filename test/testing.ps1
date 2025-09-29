#! /usr/bin/env pwsh

$data = get-content -raw $args
$data = $data.split("`n") | foreach {$_.trim()}

for (($i = 0); $i -lt 10; $i++) {


