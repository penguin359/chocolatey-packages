$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = '29cf0dd87bf50ec25b4bdc6513aa66a8f6e77f6b8d7b4cd5daca659e3f2b47ab'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = '9e6cf9469db1aaa30eee3c3c1aa90c60b2e3bb9638f356258e1d049e69db8d53'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
