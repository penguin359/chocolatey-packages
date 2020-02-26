$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.65.0/browserX-Setup-1.65.0.exe'
  checksum      = '9e7dc5d2dcaed26a919b57e81a9ba54092a74c9145661e035e754832d7dc0ccd'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
