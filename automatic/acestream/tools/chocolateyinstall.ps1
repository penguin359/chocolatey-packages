$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'http://dl.acestream.org/Ace_Stream_Media_3.1.32.exe'
  checksum      = '542422E18521655BF6A678E414EC23DF0356B6C5027034BF098CDCF1C365E9DD'
  checksumType  = 'sha256'

  # Note: silentArgs doesn't work as expected for acestream.
  # silentArgs    = "/S"
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs