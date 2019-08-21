$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.46.1/browserX-Setup-1.46.1.exe'
  checksum      = '92beb56d5a1c68598b73f33dfb243e4777fed8d8155b8eb452023247bf98266a'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
