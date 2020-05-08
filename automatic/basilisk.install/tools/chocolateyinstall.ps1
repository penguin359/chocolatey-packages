$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'http://archive.palemoon.org/basilisk/basilisk-20200508074456.win32.installer.exe'
  checksum       = '7fac020d41de6b692e2df7d6a8317d5728b2a7151f1ba78f5a51ac4b3726400c'
  checksumType   = 'sha256'

  url64          = 'http://archive.palemoon.org/basilisk/basilisk-20200508090758.win64.installer.exe'
  checksum64     = '7bc907e2ca907fae9d99f4cb77fc73ea86bd67f8e226627614a52c6b43706682'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
