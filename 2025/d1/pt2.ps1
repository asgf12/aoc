#! /usr/bin/env pwsh

# variables and stuff
$data = get-content -raw $args
$data = $data.split("`n") | foreach {$_.trim()}
$arr = new-object -TypeName System.collections.arraylist
$current = "50"
$final = 0

$data | Foreach {$arr.add($_)} > $null

for (($i = 0); $i -lt ($arr.count - 1); $i++) {
    $ctrl = $arr[$i]
    $val = $ctrl -replace "^.", ""
    if ($ctrl -like "R*") {
        $current2 = $current + $val }
    else {
        $current2 = $current - $val }
    if (-not($current2 -in (1..99))) {
        write-host "current to high/low $current2"
    while ($current2 -gt 99 -or $current2 -lt "0") {
        if ($current2 -gt 99) {
            $current2 = $current2 - 100
            write-host "$current2 $final+1"
            $final += 1 }
        elseif ($current2 -lt "0") {
            $current2 = $current2 + 100
            write-host "$current2 $final+1"
            $final += 1 }
        else {$final+=1}
    }
}
    # if (($current2 -lt 0 -and $current -gt 0) -or ($current -lt 0 -and $current2 -gt 0)) {$final += 1}
    write-host "Pre $current after $current2 final $final"
    $current = $current2
}

$final

# 6222 too low, 6241 too high, 6229 not right
