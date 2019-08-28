$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.47.0/browserX-Setup-1.47.0.exe'
  checksum      = 'c88d4174957efbc3efac953e5285f0ca02d9007499a4168bcf7cabaed557d484'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
