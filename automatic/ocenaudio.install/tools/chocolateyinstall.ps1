$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio.exe'
  checksum      = 'F6E7180ADA0A2A9443387A24BBA791EDF5C16DD0505B472EB9D56A80FE8EB28B'
  checksumType  = 'sha256'

  url64bit      = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64.exe'
  checksum64    = 'C49906DC1989EBF7DA9F0871DDDFE0E123B82AA96C97AED2DD3D9AC00D296E22'
  checksumType64= 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs