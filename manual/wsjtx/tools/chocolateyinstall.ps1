$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://physics.princeton.edu/pulsar/k1jt/wsjtx-2.0.1-win32.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'wsjtx*'

  checksum      = 'FFAE2C51143D53F899AF704E785C08C31438E682A93CB0BDB26EDEB6ECB0FFAD'
  checksumType  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs