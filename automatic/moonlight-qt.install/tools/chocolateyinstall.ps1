$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$toolsDir\MoonlightSetup-x86-1.2.0.exe"
  file64        = "$toolsDir\MoonlightSetup-x64-1.2.0.exe"
  silentArgs	= "/S"
}

Install-ChocolateyInstallPackage @packageArgs
