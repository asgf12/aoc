#! /usr/bin/env pwsh

$data = get-content -raw $args
$data = $data.split("`n") | foreach {$_.trim()}
$testarray = new-object -TypeName  System.collections.arraylist

for (($i = 0); $i -lt $PLACEHOLDER; $i++) {

