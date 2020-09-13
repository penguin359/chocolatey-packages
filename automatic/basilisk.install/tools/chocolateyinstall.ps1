$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'http://archive.palemoon.org/basilisk/basilisk-20200911102752.win32.installer.exe'
  checksum       = '9990450d162f3df2a1c174e71f2e7ba3d9f311e48b05ef0ad306bca23578549e'
  checksumType   = 'sha256'

  url64          = 'http://archive.palemoon.org/basilisk/basilisk-20200911130518.win64.installer.exe'
  checksum64     = '9e0546951d2642c8cb0050726ad5c51e165b8f5c7f84fa9f0d7e5c01ffe70b65'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
