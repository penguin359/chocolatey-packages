$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$toolsDir\SpeedCrunch-0.12-win32.exe"
  silentArgs	= "/S"
}

Install-ChocolateyInstallPackage @packageArgs