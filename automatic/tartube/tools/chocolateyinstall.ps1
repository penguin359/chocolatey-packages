$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\install-tartube-2.3.085-32bit.exe"
  file64      = "$toolsDir\install-tartube-2.3.085-64bit.exe"
  silentArgs  = "/S _?=$Env:PROGRAMFILES\$packageName"
}

Install-ChocolateyInstallPackage @packageArgs