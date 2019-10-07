$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.52.1/browserX-Setup-1.52.1.exe'
  checksum      = 'eee8d296705cfa09636191f612db6ef58297d95a89ff4284f74e7b8ae51b340e'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
