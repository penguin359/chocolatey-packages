$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.58.2/browserX-Setup-1.58.2.exe'
  checksum      = '90d89dbb3817c567691dcf9f4845791ba502c9735b6f832d375d26173ef6337c'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
