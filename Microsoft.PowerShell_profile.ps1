$ScriptList = "$ENV:USERPROFILE\Documents\WindowsPowerShell\script_list.ps1"
. $ScriptList

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
