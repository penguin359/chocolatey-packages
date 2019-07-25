$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\gp527-win32-mingw.exe"
  file64      = "$toolsDir\gp527-win64-mingw.exe"
  silentArgs  = '/VERYSILENT /SUPPRESSMSGBOXES /MERGETASKS="modifypath"'
}

Install-ChocolateyInstallPackage @packageArgs