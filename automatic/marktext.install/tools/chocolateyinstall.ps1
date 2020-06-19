$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/marktext/marktext/releases/download/v0.16.2/marktext-setup.exe'
  checksum     = 'f6b99399d6cbc1c7ffda42fecc924920e8198cbf0392bf507307241070414e14'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
