$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/marktext/marktext/releases/download/v0.16.3/marktext-setup.exe'
  checksum     = '078884adf9f5bf02d02580ea9af0f04b3b7ae471aebb276d81bc7ac78e97e5af'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
