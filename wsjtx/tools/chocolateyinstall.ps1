$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://physics.princeton.edu/pulsar/k1jt/wsjtx-2.5.3-win32.exe'
$url64      = 'https://physics.princeton.edu/pulsar/k1jt/wsjtx-2.5.3-win64.exe'
$checksum   = '7E461B40DBA106A4D4FAF53A5BEB862D2C1D80663E4F08748F8B498BCD7F0C6B'
$checksum64 = 'F0C89987DAB4F0666DA0E79F66D45295710B7926259FC9B259950C792321E860'

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
