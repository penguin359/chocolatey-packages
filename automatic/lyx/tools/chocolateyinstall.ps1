$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\LyX-2352-Installer-4.exe"
  file64      = "$toolsDir\LyX-2352-Installer-4.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs