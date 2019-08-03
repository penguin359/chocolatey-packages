$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'http://eu.basilisk-browser.org/release/basilisk-latest.win32.installer.exe'
  checksum      = 'E7B1FAE9EE0953921AEEEE31AB87BCA049139963E1C52B22FF282F793ACD03DD'
  checksumType  = 'sha256'
  
  url64bit      = 'http://eu.basilisk-browser.org/release/basilisk-latest.win64.installer.exe'
  checksum64    = 'B4E7DEAB74C5DF327E26C074F3A7519863764859AB4694A2E962D3DEFCDA1B65'
  checksumType64= 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs