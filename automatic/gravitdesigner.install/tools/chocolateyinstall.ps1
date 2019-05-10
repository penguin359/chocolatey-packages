$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://designer.gravit.io/_downloads/windows/GravitDesignerInstaller.exe'
  checksum      = '71adb16f27ccec9dff09e8b09a9ad2d9ca27a659e6b08e9009b8c0b86ac0ae72'
  checksumType  = 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs