$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/getstation/desktop-app-releases/releases/download/1.42.1/browserX-Setup-1.42.1.exe'
  checksum      = '7d8b602245792f53c75e15fe5ff26f79834375f3b29925b6c4953cd9f7db85df'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
