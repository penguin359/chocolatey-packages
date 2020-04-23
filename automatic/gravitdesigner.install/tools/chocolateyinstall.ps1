$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://designer.gravit.io/_downloads/windows/GravitDesignerInstaller.exe'
  checksum      = '7302a4db1919ea54b39e40ca54dcebba671e9a6a4c710558440625cb2450c188'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
