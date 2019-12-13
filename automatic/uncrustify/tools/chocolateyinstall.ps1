$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = "$env:ChocolateyPackageName"
  destination = "$toolsDir"    
  file        = "$toolsDir\uncrustify-0.70.1_f-win32.zip"
  file64      = "$toolsDir\uncrustify-0.70.1_f-win64.zip"
}

Get-ChocolateyUnzip @packageArgs
