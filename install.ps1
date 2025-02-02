Start-Process powershell -Verb RunAs -Wait -ArgumentList "-file $PSScriptRoot\windows\programs.ps1"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
pwsh $PSScriptRoot\windows\config.ps1 
