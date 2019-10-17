$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.56.0/browserX-Setup-1.56.0.exe'
  checksum      = '0946f90eb273c508980bbd36c57d9a4fe72a145c00e084c37617c188601f7dd4'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
