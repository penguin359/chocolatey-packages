$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  file         =  'bping.exe'

  url           = 'https://gizmoware.net/bping/bping.zip'
  checksum      = '40D976ED02484B82DF223F35509FD21165F15A28A1713E5AB821E57E27E1E21D'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs