$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$toolsDir\klatexformula-4.1.0-win32.exe"
  silentArgs    = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
