$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.45.2/browserX-Setup-1.45.2.exe'
  checksum      = '9f1c375d0237764b5a59d066e01122c2480fb6abdbdbd51f5996d3b61f78339c'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
