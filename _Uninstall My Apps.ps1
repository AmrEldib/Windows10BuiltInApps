foreach($line in Get-Content '.\_AppsToRemove.conf') {
    if ($line.EndsWith(".ps1")) {
        Invoke-Expression "& '.\$line'"
        Write-Output "Ran '$line'"
    }
    elseif ($line.EndsWith(".reg")) {
        Invoke-Expression "regedit /s $line"
        Write-Output "Ran '$line'"
    }
}