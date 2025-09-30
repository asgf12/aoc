#! /usr/bin/env pwsh

# variables and stuff
$data = get-content -raw $args
$data = $data.split("`n") | foreach {$_.trim()}
$arr = new-object -TypeName System.collections.arraylist

for (($i = 0); $i -lt $PLACEHOLDER; $i++) {

