$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/marktext/marktext/releases/download/v0.15.1/marktext-setup-0.15.1.exe'
  checksum     = 'd92d685b22b594720040034bf26cb1935f8a88dff1bda122e08bc4070d4978cc'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
