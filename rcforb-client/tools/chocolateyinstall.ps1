$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.remotehams.com/download.php?dir=orb&file=RCForbClientSetup_v0.9.297.exe'
$checksum   = 'f95b9a67ab6384e4c4eba9af07cd26bea1af65b0aa07eeb746fd772623f43568'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'RCForb Client*'

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0)
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
