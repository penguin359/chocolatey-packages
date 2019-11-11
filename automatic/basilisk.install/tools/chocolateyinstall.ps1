$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://eu.basilisk-browser.org/release/basilisk-latest.win32.installer.exe'
  checksum       = 'f90fc8cb7ab4e384dddb6775998d4407eaddefe08c4e58e0d8997123164b88ce'
  checksumType   = 'sha256'

  url64          = 'https://eu.basilisk-browser.org/release/basilisk-latest.win64.installer.exe'
  checksum64     = '748be5f5aa6ef3ec9a30a28f98db6e5d130453231f87f57859a32a77d5bbb3c2'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
