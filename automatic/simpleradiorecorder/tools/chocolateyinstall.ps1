$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         =  "$toolsDir\\SRR Setup 1.2.7.1.exe"

  url           = 'https://dennisbabkin.com/php/downloads/simple_radio_recorder.zip'
  checksum      = '84837FCDF35723D3CFF6B90E5A360DF388A9891B129A00FFEFE68C308F803518'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs