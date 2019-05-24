$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$toolsDir\tusk-setup-0.23.0.exe"  
  silentArgs    = "/S"
}

Install-ChocolateyInstallPackage @packageArgs