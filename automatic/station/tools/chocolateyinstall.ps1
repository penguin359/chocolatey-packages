$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.41.1/browserX-Setup-1.41.1.exe'
  checksum      = 'BD350361A37CFA5416084A3997B681B64BD1B318F30C26F92DD7664FF52AAD0A'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs