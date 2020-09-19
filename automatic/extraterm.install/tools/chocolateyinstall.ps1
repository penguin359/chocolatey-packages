$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = "$toolsDir\extraterm-setup-0.53.1.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
