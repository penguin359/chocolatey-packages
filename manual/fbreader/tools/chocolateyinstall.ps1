$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\FBReaderSetup-0.12.10.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs