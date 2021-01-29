$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\yara-v4.0.4-1544-win32.zip"
  file64      = "$toolsDir\yara-v4.0.4-1544-win64.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file
