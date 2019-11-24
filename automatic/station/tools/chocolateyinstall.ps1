$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.59.2/browserX-Setup-1.59.2.exe'
  checksum      = 'f7f98fc37b2b2a01c7646f60fbf6bee7769268d1e258de12f3259fec889f7f71'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
