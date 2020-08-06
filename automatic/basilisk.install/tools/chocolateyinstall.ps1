$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'http://archive.palemoon.org/basilisk/basilisk-20200610031800.win32.installer.exe'
  checksum       = 'e75a0d13442e69af94c9833e66162cc1d1732b8cec9b383dbe712e33a0efeeac'
  checksumType   = 'sha256'

  url64          = 'http://archive.palemoon.org/basilisk/basilisk-20200610033543.win64.installer.exe'
  checksum64     = 'c4c88a1a0ef50863b74d654a0594bfaa68677f1e76a11a243061923f8977e4cc'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
