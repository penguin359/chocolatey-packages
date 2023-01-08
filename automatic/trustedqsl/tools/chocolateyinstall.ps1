$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.arrl.org/files/file/LoTW%20Instructions/tqsl-2.6.5.msi'
$checksum   = '490feb0a18efc05f5927f26844c61ad70ee4fda98770ef36c16090c7bc66bf1c'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url

  softwareName  = 'Trusted QSL*'

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
