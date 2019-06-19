$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.25.9-win32-install.exe'
  checksum      = '4fd3efdf86beeacc3b969d2cf788c17049aba31c069cc31cea07d06eb2e13ade'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.25.9-win64-install.exe'
  checksum64    = '5be6114edc2940b586f8b805bed75b28e1867f57e65ee9da5028f34e752a5d79'
  checksumType64= 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
