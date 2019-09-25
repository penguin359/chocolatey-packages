$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.plantronics.com/content/dam/plantronics/software/PlantronicsHubInstaller.exe'
  checksum     = '502b54fd1df8cf0a2c2e9fbbb784aa70b1bce74d6be9a2a32e5558d678f39408'
  checksumType = 'sha256'

  silentArgs   = '/install /quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
