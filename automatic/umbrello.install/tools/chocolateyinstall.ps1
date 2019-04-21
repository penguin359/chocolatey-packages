$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://download.kde.org/stable/umbrello/latest/win32/umbrello-i686-w64-mingw32-2.27.3-10.4-setup.exe'
  checksum      = '68D5E660869723A2575B527AA72A636168E8FC98FA51A4629344DD5C46544612'
  checksumType  = 'sha256'
  
  url64bit      = 'https://download.kde.org/stable/umbrello/latest/win64/umbrello-x86_64-w64-mingw32-2.27.3-82.4-setup.exe'
  checksum64    = '3EA414AAB9BD05FA067FE0A44D1E44EC379BC83B66A5B0E2806417954ACF37DF'
  checksumType64= 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs