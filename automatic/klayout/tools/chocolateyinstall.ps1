$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26.1-win32-install.exe'
  checksum      = '1c5889b80cbfa3e4cb82dd5862961519ff39e0190080cf511ad82975e6fbb5c2'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26.1-win64-install.exe'
  checksum64    = 'f2562ed038e0b0e0e0a92d3df3fc1308e62a2912266e1eb72ac8b7e8d389588f'
  checksumType64= 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
