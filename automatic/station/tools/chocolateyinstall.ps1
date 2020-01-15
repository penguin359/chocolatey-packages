$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.63.4/browserX-Setup-1.63.4.exe'
  checksum      = '7e9a746d72f064f15824705a67cd80272f347d99c42d737a37b591124475e018'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
