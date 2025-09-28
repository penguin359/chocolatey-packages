$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://downloads.winlink.org/User%20Programs/Winlink_Express_install_1-7-26-0.zip'
$checksum   = 'd0fe8653f6593067b752a0a97c81aeb7cddbfe5eb0792f7617ad65557b5075a5'
$setupName  = 'Winlink_Express_install.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'Winlink Express*'

  checksum      = $checksum
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyZipPackage @packageArgs
$packageArgs.file = Join-Path -Path $toolsDir -ChildPath $setupName
Install-ChocolateyInstallPackage @packageArgs
