$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://www.hamrick.com/files/vuex3296.exe'
  checksum       = '4aab8beeca3857462dccb67c095dc0cb6f4e69f0121f2b22ffd9bc27f52307d9'
  checksumType   = 'sha256'

  url64          = 'https://www.hamrick.com/files/vuex6496.exe'
  checksum64     = '142bacb60e7047a003b6f62e595bc6b06f7e928d44cad17a156755976444f200'
  checksumType64 = 'sha256'
}

# This is needed for unattended installation of Drivers
& "C:\Windows\System32\certutil.exe" -addstore "TrustedPublisher" "$toolsDir\certificates\Hamrick Software.cer" | Out-Null

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs