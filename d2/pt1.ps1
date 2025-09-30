#! /usr/bin/env pwsh

$data = get-content -raw $args
$data = $data.split("`n") # | foreach {$_.trim()}
$incr = $null

foreach ($line in $data) {
    $valid=0
    $arr = new-object -TypeName System.collections.arraylist
    $line.split(" ") | foreach {if ($_ -ne "") {$arr += $_}}
    # $arr | get-member
    write-host "checking $arr"
    if ($incr -eq $null) {
        $init = ($arr[0] - $arr[1])
        if ($init -in (-1..-3)) {
            $incr = $true
            write-host "init valid, rising" }
        elseif ($init -in (1..3)) {
            $incr = $false
            write-host "init valid, lowering" }
        else {continue}
    }
    for (($i = 0); $i -lt ($arr.length - 1); $i++) {
        $diff = $arr[$i] - $arr[($i + 1)]
        if ($incr -eq $true -and $diff -in (-1..-3)) {
            $valid++
            write-host $arr[$i] - $arr[($i + 1)]"$i valid $valid"
            # continue
            }
        elseif ($incr -eq $false -and $diff -in (1..3)) {
            $valid++
            write-host $arr[$i] - $arr[($i + 1)]"$i valid $valid"
            # continue
            }
        else {
            Write-host "invalid"
            $incr = $null
            break
        }
    if ($valid -eq ($arr.length - 1)) {
        echo safe
        $final++
        }
    }
    $incr = $null
}

Write-host "$final are safe!"


