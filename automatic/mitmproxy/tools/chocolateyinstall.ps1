$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\mitmproxy-4.0.4-windows-installer.exe"
  silentArgs  = "--mode unattended"
}

Install-ChocolateyInstallPackage @packageArgs