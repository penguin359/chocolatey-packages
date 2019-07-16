$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'B1 Free Archiver'
  fileType      = 'exe'
  file          = "${env:ProgramFiles(x86)}\B1 Free Archiver\installer.exe"
  silentArgs    = "uninstall.xml"
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyuninstall.ahk`""
Uninstall-ChocolateyPackage @packageArgs