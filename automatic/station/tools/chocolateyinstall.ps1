$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.51.1/browserX-Setup-1.51.1.exe'
  checksum      = '08621db56509a89e9d3d43a6b043e6d8163054573c4a61c62195cead3b82fb9e'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
