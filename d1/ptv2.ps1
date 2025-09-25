#!/usr/bin/env pwsh

# Variables - arrays
$arr1 = @( )
$arr2 = @( )
$first = @( )
$second = @( )
$values= @{ }
# importing data and cleaning into long list (all values in newlines
$Sample = Get-Content -delimiter ' ' $args
$data = ($Sample -replace '   ', "`n")
$datafin = ($data -split "`n")

# loop through data and make arrays (even to first arr)
for (($i = 0); $i -lt $datafin.Count; $i++){
    if ($i % 2 -eq 0) {
        # int needed cause of bug with whitespaceses, but it seems to be null divided so 0's out
        if ([int32]$datafin[$i] -ne 0 ) { $arr1 += [int32]$datafin[$i] }
    } else {
        if ([int32]$datafin[$i] -ne 0 ) { $arr2 += [int32]$datafin[$i] }
    }
}

# just sorting
$arr1 | sort-object | foreach {$first += $_}
$arr2 | sort-object | foreach {$second += $_}

# write-host "A $first`nB $second" # debug

# get each num from $first and check $second for same value count
foreach ($num in $first) {
    $second | foreach-object {
        if ($_ -eq $num) {
            if ($values.containskey($num) -eq $true) {
                $values.item($num) += $_
                $final += $num }
            else {
                $values.add($num, $_.count)
                $final += $num }
        }
    }
}

$values
write-host $final
# 21070419
