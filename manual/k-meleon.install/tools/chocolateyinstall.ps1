$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = "$toolsDir\K-Meleon75.1.exe"
  silentArgs	= "/S"
}

Install-ChocolateyInstallPackage @packageArgs