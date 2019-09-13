$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.49.0/browserX-Setup-1.49.0.exe'
  checksum      = 'd037ace6ebb6fc962132f3e40716422950da0845a3dd50ad1cd0f9abee68bc5f'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
