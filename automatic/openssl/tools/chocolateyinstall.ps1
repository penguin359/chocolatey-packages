$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\Win32OpenSSL-1_1_1d.exe"
  file64      = "$toolsDir\Win64OpenSSL-1_1_1d.exe"
  silentArgs  = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyInstallPackage @packageArgs
