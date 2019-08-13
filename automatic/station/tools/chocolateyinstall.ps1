$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.45.1/browserX-Setup-1.45.1.exe'
  checksum      = '8065150e00024323dbbc3c296952a4ad68bca2a6c269ab4da9b53c24195ac394'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
