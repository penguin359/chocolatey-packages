$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26.3-win32-install.exe'
  checksum      = 'f963e2ddab39107625f88bb343c71d1174c061cb084417d9b0a498d960896498'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26.3-win64-install.exe'
  checksum64    = '4271b5affa89684607f79fd5e9937a9302e1fb022057ce22ef585ebac05804f9'
  checksumType64= 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
