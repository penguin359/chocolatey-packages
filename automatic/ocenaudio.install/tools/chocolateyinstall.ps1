$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = '1eba78f3df099845af9c62863bebda794bd27f8e7b5bb4507a5a18e4b33903ef'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = '419d5439ab0fd434a504ecb95eaf88812ed66a37e6542b5ae2d0607e6dce5242'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
