$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.45.3/browserX-Setup-1.45.3.exe'
  checksum      = 'e294bd36ff4ba07ff525c63c19d2ebe317371c2489cbbae0eabae628df23d866'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
