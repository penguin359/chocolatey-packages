$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.25.8-win32-install.exe'
  checksum      = '6478E2A70BAB13881DFF9845493FE6A379EBB7FC63CDF02363C1AD2E372898B2'
  checksumType  = 'sha256'

  url64bit      = 'https://www.klayout.org/downloads/Windows/klayout-0.25.8-win64-install.exe'
  checksum64    = '486A7B84CD4A8D72581B870AA1A54785930A785F9DA7787440B6070A2AE41438'
  checksumType64= 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs