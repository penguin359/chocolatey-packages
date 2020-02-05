$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.64.1/browserX-Setup-1.64.1.exe'
  checksum      = '9a152c247b0bdc19b9bb6129aa4735e032a8711265db206bd46e7cc1e2266ab8'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
