$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://eu.basilisk-browser.org/release/basilisk-latest.win32.installer.exe'
  checksum       = 'f3425b3c310630a4c276649f2e50795a101e5de3e63b772c46d42403c1c21482'
  checksumType   = 'sha256'

  url64          = 'https://eu.basilisk-browser.org/release/basilisk-latest.win64.installer.exe'
  checksum64     = '949ceed03f3247f796719f2a3d37ed6e3f181aa2eec572e196f759984703ac7d'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
