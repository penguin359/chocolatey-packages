$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName"
  destination   = "$toolsDir"    
  file          = "$file\uncrustify-0.68.1-win32.zip"
  file64        = "$file\uncrustify-0.68.1-win64.zip"
}

Get-ChocolateyUnzip @packageArgs