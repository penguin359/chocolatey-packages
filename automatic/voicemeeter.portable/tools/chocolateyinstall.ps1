$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\VoicemeeterSetup_v1068.zip"
}

Get-ChocolateyUnzip @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  fileFullPath  = "$toolsDir\VoicemeeterSetup.exe"
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs
