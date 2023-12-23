$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.remotehams.com/download.php?dir=orb&file=RCForb_0.7.8560.exe'
$checksum   = '8b7c0c13f3c6e74615a86d2eb2b14e43043671ff2bc1556bd973d2553244ed97'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'RCForb (Server)*'

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0)
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
