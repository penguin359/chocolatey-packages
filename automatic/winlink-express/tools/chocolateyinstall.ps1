﻿$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://downloads.winlink.org/User%20Programs/Winlink_Express_install_1-7-2-0.zip'
$checksum   = '10f1b86e36a22afe53f51aa38b8411e17a8c8e7eecd65629188c1406085695f0'
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