$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.remotehams.com/download.php?dir=orb&file=RCForbClientSetup_v0.9.319.exe'
$checksum   = '2718e7b1b7e658cb43a00c0a5fba430501ce6b27ba8c4d752382cb5619e9f035'

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
