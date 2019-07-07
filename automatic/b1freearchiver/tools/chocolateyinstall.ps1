$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://www.b1.org/smart-download/0/os=windows&src=btn_orng/B1FreeArchiver_1.7.120.exe'
  checksum      = '609E5A1626260C21509D6BEA7CC9FFFFFBAD07F5FF7DDE10FD21F635B4EA9566'
  checksumType  = 'sha256'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs