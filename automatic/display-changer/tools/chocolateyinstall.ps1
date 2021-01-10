$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  destination  = "$toolsDir"

  url          = 'https://12noon.com/files/dc.zip'
  checksum     = 'ffd9d44fb6768717c9d47929203ba5ba738d53730b7d5c582d3f768ff7707982'
  checksumType = 'sha256'

  # silentArgs   = '/S'
}

# Install-ChocolateyPackage @packageArgs
Install-ChocolateyZipPackage @packageArgs
