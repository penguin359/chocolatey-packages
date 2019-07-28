$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'http://lf2.net/LF2_v2.0a.exe'
  checksum     = '540C485547E234B0D09595F54D067AAFD7176092C308ACA61868F3CBC03030E1'
  checksumType = 'sha256'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs