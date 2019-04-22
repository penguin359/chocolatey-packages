$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://designer.gravit.io/_downloads/windows/GravitDesignerInstaller.exe'
  checksum      = '3646791EF3594ACF2ECE00D3FF8DEBA73B739B84CB075E36B5E7D87C497DABD6'
  checksumType  = 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs