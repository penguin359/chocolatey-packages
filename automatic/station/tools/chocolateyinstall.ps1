$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.58.1/browserX-Setup-1.58.1.exe'
  checksum      = '52e5a66941e68133898fe85abc852e9834c4dada802f31ee78b3f368c7807cf2'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
