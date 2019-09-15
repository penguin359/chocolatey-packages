$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\hdrmerge-setup-0.5.0.exe"
  file64      = "$toolsDir\hdrmerge-setup64-0.5.0.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs