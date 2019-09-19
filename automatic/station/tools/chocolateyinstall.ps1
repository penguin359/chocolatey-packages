$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.50.1/browserX-Setup-1.50.1.exe'
  checksum      = 'a2f758482ef16249c0107b1d6f105452251a5a066aad4c822df9390470a39359'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
