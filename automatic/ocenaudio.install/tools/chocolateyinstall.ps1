$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = '410a8bcade790f92be67ec6a8fbdea270be3c1322850d24b2a151ef05d7202f5'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = 'a1bb2dcd893d07c7f5df2f2a97e7adb008ac5543ef9e530b0ec05c0aa1efe391'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
