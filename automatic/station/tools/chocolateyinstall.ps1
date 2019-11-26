$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.60.1/browserX-Setup-1.60.1.exe'
  checksum      = '55b4ba25dafb6b008f5708bdc43e0f66e793c0f249fe40d533c73c706aed4e2f'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
