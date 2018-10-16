$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

foreach ($line in Get-Content (Join-Path $scriptPath '.\_AppsToRemove.conf')) {
    if ($line.EndsWith(".ps1")) {
        $file = Join-Path $scriptPath "`"$line`""
        Invoke-Expression -Command $file
        Write-Output "Ran '$file'"
    }
    elseif ($line.EndsWith(".reg")) {
        $file = Join-Path $scriptPath .\$line
        Invoke-Expression 'reg import "$file"'
        Write-Output "Ran '$file'"
    }
}