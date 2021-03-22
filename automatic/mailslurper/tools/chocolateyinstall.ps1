$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PackageParameters     = Get-PackageParameters

### PARAMETERS
If ($PackageParameters.InstallDir) { $installDir = $PackageParameters.InstallDir }
  Else { $installDir = "$toolsDir" }

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$installDir"
  file          = "$toolsDir\mailslurper-1.14.1-windows.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

Write-Warning "- mailslurper.exe must be launched from the directory containing the config file config.json."
Write-Warning "- An example of config.json is available in $installDir"