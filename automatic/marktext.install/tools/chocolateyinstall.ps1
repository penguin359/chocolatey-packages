$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/marktext/marktext/releases/download/v0.16.1/marktext-setup.exe'
  checksum     = '2b389c0bf3e7d9348d1e69ee5ffc9485b4c18da017c955c019e92029c824b037'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
