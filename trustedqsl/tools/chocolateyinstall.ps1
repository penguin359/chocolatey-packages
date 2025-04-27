$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.arrl.org/files/file/LoTW%20Instructions/tqsl-2.8.msi'
$checksum   = '9a9ab32d26b164cbd3cbf32eb96cd2404d6334d9bdc55364c583ed8e0d494d5f'

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
