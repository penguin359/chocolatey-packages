$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.57.1/browserX-Setup-1.57.1.exe'
  checksum      = '5c8e49354cd01c459a760fd4ea0c95a576d5699208a6aa568a43b6a9896dc621'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
