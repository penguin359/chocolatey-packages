$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://wsjt.sourceforge.io/downloads/wsjtx-2.6.0-win32.exe'
$url64      = 'https://wsjt.sourceforge.io/downloads/wsjtx-2.6.0-win64.exe'
$checksum   = '662862389AF090BA858EBCD368A06B20E8D821FD23431E5A858856BC9AEEF5AE'
$checksum64 = '37DA9ACBBA94538A51DDE84BACAFDFEA5EE14B9003891BE491158CEE88BA2B3D'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'WSJT-X:*'

  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs    = '/S'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
