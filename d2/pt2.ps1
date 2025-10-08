#! /usr/bin/env pwsh

$data = get-content -raw $args
$data = $data.split("`n") # | foreach {$_.trim()}
$incr = $null

function Ch-init {
    param ( $par )
    if ($incr -eq $null) {
        $init = ($par[0] - $par[1])
        if ($init -in (-1..-3)) {
            $Script:incr = $true
            write-host "init valid, rising" $incr}
        elseif ($init -in (1..3)) {
            $Script:incr = $false
            write-host "init valid, lowering" }
        else {continue}
    }
}
function invalid-mode {
    param ( $par )
    $Script:TmpArr = new-object -TypeName System.collections.arraylist
    for (($i = 1); $i -lt ($par.length); $i++) {
# todo make a loop to populate tmparr, remove does not work
        # $par.removeat($i) | foreach {$TmpArr.add($_)}
        Write-host "to check new = $TmpArr"
# todo logic to check tmparr, only in func
    }
}

foreach ($line in $data) {
    $valid=0
    $arr = new-object -TypeName System.collections.arraylist
    $line.split(" ") | foreach {if ($_ -ne "") {$arr += $_}}
    invalid-mode $arr
    exit
    # $arr | get-member
    write-host "checking $arr"
    Ch-init $arr
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
            invalid-mode $arr #  break
        }
    if ($valid -eq ($arr.length - 1)) {
        echo safe
        $final++
        }
    }
    $incr = $null
}

Write-host "$final are safe!"


