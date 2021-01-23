$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = "$toolsDir\extraterm-setup-0.57.1.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
