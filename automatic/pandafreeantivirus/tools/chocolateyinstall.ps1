$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'http://acs.pandasoftware.com/Panda/FREEAV/190612/PANDAFREEAV.exe'
  checksum      = '00CEF69FF557BFEE8CED3E7567B744F2D444374872B9C10A5B72AFDAFAC8E25E'
  checksumType  = 'sha256'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs