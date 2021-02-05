$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum       = 'f7599b55cf182ab1a704a6e9ee7f35e38940f07ccbf1499d1031857e470b7b59'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64     = '6a02f7deaa78d86b31cf419aa64ca94de9cb2c425155375d35a3ede342e4ca48'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
