$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.klayout.org/downloads/Windows/klayout-0.26-win32-install.exe'
  checksum      = 'b6f50c97e5a80bb123269bbf594590e28cb85188d7ea32d9dee1523f5a1b7a31'
  checksumType  = 'sha256'

  url64         = 'https://www.klayout.org/downloads/Windows/klayout-0.26-win64-install.exe'
  checksum64    = '0a729cd64c6b6a478eb8e725610efe0c664ca923a3dfd1ed35f7dc340bca3929'
  checksumType64= 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
