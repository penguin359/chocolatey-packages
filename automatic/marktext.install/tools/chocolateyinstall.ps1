$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://github.com/marktext/marktext/releases/download/v0.14.0/marktext-setup-0.14.0.exe'
  checksum      = 'a87c0eea1ea68670425ef8d72d3690a9f0c0c7d6565020ed68847a2bf97bfdb2'
  checksumType  = 'sha256'
  
  silentArgs	= "/S _?=$Env:PROGRAMFILES\$packageName"
}

Install-ChocolateyPackage @packageArgs
