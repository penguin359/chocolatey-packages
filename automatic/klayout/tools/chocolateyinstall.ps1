$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26.4-win32-install.exe'
  checksum      = 'c912006ddec865f7ca8e528de2d61f94eaef55c98ba3ca65632d0a1f3f3a3ce1'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26.4-win64-install.exe'
  checksum64    = '45a700b40e3bc0cafe8669485d14f7ca83330e9e5c290013ac439fdb40503c95'
  checksumType64= 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
