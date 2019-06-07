$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.43.1/browserX-Setup-1.43.1.exe'
  checksum      = '99cfcabe07ac25939c6e039bbcee7d94e217bb8cfbbd1c1d75f90ecb095cb8f4'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
