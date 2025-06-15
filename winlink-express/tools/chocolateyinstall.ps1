$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://downloads.winlink.org/User%20Programs/Winlink_Express_install_1-7-24-0.zip'
$checksum   = '8898892d533b1e372954e8f8161b65a79578219a91c795ec876a419dc76af069'
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
