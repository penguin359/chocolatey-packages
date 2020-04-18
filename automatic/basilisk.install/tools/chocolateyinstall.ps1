$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'http://archive.palemoon.org/basilisk/basilisk-20200417114514.win32.installer.exe'
  checksum       = 'ff0601b212e27e920233bba5b312ad69a0bfd597de5ed56bb5842e7feaf603b5'
  checksumType   = 'sha256'

  url64          = 'http://archive.palemoon.org/basilisk/basilisk-20200417135357.win64.installer.exe'
  checksum64     = 'b6b1f76609f123f6f2705ccc0ce466c284418107e61d72e796b893c2beceac77'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
