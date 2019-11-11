$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url			= 'http://tonnesoftware.com/downloads/LCinstall284.exe'
  checksum		= 'EDC68F0E87D94A50B06EBD890E8E6BDEFD9F23B672801DF2F40B1E3B28A4AEBC'
  checksumType	= 'sha256'

  validExitCodes= @(1)
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs