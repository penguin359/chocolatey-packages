$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\LyX-2361-Installer-3-x32.exe"
  file64      = "$toolsDir\LyX-2361-Installer-3-x64.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs