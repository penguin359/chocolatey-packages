$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\bs1770gain-0.6.0-win32.7z"
  file64      = "$toolsDir\bs1770gain-0.6.0-win64.7z"  
}

Get-ChocolateyUnzip @packageArgs
