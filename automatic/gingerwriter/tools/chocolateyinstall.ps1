$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  fileFullPath	= "$toolsDir\GingerWriterSetup.exe"
  url           = 'https://downloads.gingersoftware.com/files/windows/GingerWriterSetup.exe'
  checksum      = 'ADA5BEC46A438F4A1E09D092E89B4D2A09A2260A08F2ABA2174ED32B8EA4DC24'
  checksumType  = 'sha256'
}

If (( Get-Item 'HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion').GetValue('ReleaseID') -lt "1803" ) {
  Write-Error 'Ginger Writer runs only with Windows 10 version 1803 or greater'
  Return
} else {
  Start-Process AutoHotKey -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
  Install-ChocolateyPackage @packageArgs
}