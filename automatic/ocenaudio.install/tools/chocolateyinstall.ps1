$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = 'e04336690310458722be10ab47ee1ccab87ccd60a7a9548a8e02a810d4d3e5ff'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = 'f8920d9c1891e6af0d95ee8e0adbde2a824733fe6ed0f4fc8b2f2fab9bb2dc99'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
