$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/marktext/marktext/releases/download/v0.15.0/marktext-setup-0.15.0.exe'
  checksum     = '022315cee8f8157317cffa02385d31b4d4b8b5547ca752fffc6fa3c71fefb6e4'
  checksumType = 'sha256'
  
  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs