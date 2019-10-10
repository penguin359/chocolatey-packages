$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.52.2/browserX-Setup-1.52.2.exe'
  checksum      = 'f3f1ccf3360b244e95d0b8c8116e1224f2712dfb0e75e623e91538a712054741'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
