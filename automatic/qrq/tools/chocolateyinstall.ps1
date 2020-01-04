$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\qrq-0.3.3.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs