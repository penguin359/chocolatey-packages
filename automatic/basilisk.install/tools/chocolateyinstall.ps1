$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'http://archive.palemoon.org/basilisk/basilisk-20201125140449.win32.installer.exe'
  checksum       = '05240bb65daf43fdda01cc45b483a4a9326cd3f8e4f2123e8ec7d0b7ec958341'
  checksumType   = 'sha256'

  url64          = 'http://archive.palemoon.org/basilisk/basilisk-20210317091631.win64.installer.exe'
  checksum64     = '24e3fbfd5c37df974dabf741837dabeb23cb0510856994f7a3b0efd545c0955b'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
