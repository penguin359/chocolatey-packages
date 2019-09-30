$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$toolsDir\MoonlightSetup-x86-1.1.1.exe"
  file64        = "$toolsDir\MoonlightSetup-x64-1.1.1.exe"
  silentArgs	= "/S"
}

Install-ChocolateyInstallPackage @packageArgs
