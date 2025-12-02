#! /usr/bin/env pwsh

# variables and stuff
$data = get-content -raw $args
$data = $data.split("mul(") | foreach {$_.trim()}
$regmatch = '^[0-9]+\,[0-9]+\)'

foreach ($line in $data) {
    if ($line -match $regmatch) {
        $line | foreach {
            $tmp = $_ -replace '\).*',''
            $int1 = $tmp -replace '.*\,',''
            $int2 = $tmp -replace '\,.*',''
            $a = [int]$int1 * [int]$int2
            $final += $a
        }
    }
}
write-host "final = $final"

