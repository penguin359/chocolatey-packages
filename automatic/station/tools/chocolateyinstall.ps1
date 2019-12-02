$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.61.0/browserX-Setup-1.61.0.exe'
  checksum      = '90b96300ab1831eb727cbf47a3d9e1dfb82976abaff39590786aed190aff0dc1'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
