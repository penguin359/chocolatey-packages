$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.44.1/browserX-Setup-1.44.1.exe'
  checksum      = '3cab66e8facdd4972673f2914d92231c01f3a465d34bce0277e8c99d0a546c30'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
