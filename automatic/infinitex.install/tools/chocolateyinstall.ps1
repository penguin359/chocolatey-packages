$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$toolsDir\InfiniTex-Setup-0.9.16.exe"
  silentArgs	= "/S"
}

Install-ChocolateyInstallPackage @packageArgs