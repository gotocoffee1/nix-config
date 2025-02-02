Install-PSResource -Name NerdFonts -TrustRepository -Reinstall
Import-Module -Name NerdFonts
Install-NerdFont -Name 'FiraCode'

(Get-Content "$PSScriptRoot\profile.ps1").Replace('{{CONFIG_REPO}}', ("$PSScriptRoot\.." | Convert-Path)) | Set-Content $PROFILE 