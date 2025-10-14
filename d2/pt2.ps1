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
    :UWU for (($i = 1); $i -le ($par.length); $i++) {
        $subvalid = 0
        $TmpArr = $null
        $Script:TmpArr = @()
        $counter = 0
        for (($j = 0); $j -lt ($par.length); $j++) {
            if ($counter -ne $i) {
                $TmpArr+=$par[$j]
            }
            $counter++
        }
# todo logic to check tmparr, only in func
# array dont seem to work, echo suggests checking not values, but digits (64>67 checks 6to4)
        for (($k = 1); $k -le ($TmpArr.length); $k++) {
            Write-host "to check new = $TmpArr"
            $invdiff = $TmpArr[($k - 1)] - $TmpArr[$k]
            if ($incr -eq $true -and $invdiff -in (-1..-3)) {
                $subvalid++
                write-host $TmpArr[($k - 1)] - $TmpArr[$k]"$k valid $subvalid"
                # continue
                }
            elseif ($incr -eq $false -and $invdiff -in (1..3)) {
                $subvalid++
                write-host $TmpArr[($k - 1)] - $TmpArr[$k]"$k valid $subvalid"
                # continue
                }
            else {
                write-host "subinvalid"
                break
            }
        if ($subvalid -eq ($TmpArr.length - 1)) {
            echo safe
            $Script:final++
            break UWU
            }
        }
    }
}

foreach ($line in $data) {
    $valid=0
    $arr = new-object -TypeName System.collections.arraylist
    $line.split(" ") | foreach {if ($_ -ne "") {$arr += $_}}
    write-host "checking $arr"
    Ch-init $arr
        for (($i = 0); $i -lt ($arr.length - 1); $i++) {
        $diff = $arr[$i] - $arr[($i + 1)]
        if ($incr -eq $true -and $diff -in (-1..-3)) {
            $valid++
            # write-host $arr[$i] - $arr[($i + 1)]"$i valid $valid"
            # continue
            }
        elseif ($incr -eq $false -and $diff -in (1..3)) {
            $valid++
            # write-host $arr[$i] - $arr[($i + 1)]"$i valid $valid"
            # continue
            }
        else {
            Write-host "invalid"
            invalid-mode $arr
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


