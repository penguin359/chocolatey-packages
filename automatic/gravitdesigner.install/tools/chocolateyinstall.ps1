$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://designer.gravit.io/_downloads/windows/GravitDesignerInstaller.exe'
  checksum      = '8ddf92b87b761f68a91299252b438ad30548fa7d495f3ce1f56a6764ab8863f7'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
