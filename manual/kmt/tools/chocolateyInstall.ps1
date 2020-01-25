$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://www.thegoffs.co.uk/downloads/KochMorseTrainer%20Install.exe'
  checksum      = 'B4F534FC06E8F05E7974FDD06088CD24794E6DDF9CBF75207A1F454CE9B2ED4F'
  checksumType  = 'sha256'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyInstall.ahk`""
Install-ChocolateyPackage @packageArgs
