#! /usr/bin/env pwsh

# variables and stuff
$data = get-content -raw $args
$data = $data.split("`n") | foreach {$_.trim()}
$arr = new-object -TypeName System.collections.arraylist
$current = 50
$final = 0

$data | Foreach {$arr.add($_)} > $null

for (($i = 0); $i -lt ($arr.count - 1); $i++) {
    $ctrl = $arr[$i]
    $val = $ctrl -replace "^.", ""
    if ($ctrl -like "R*") {
        $current = $current + $val }
    else {
        $current = $current - $val }
    if ($current -eq 0 -or $current -match ".*00$" ) { $final+=1}
}

$final
