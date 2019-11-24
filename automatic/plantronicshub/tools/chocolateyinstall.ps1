$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.plantronics.com/content/dam/plantronics/software/PlantronicsHubInstaller.exe'
  checksum     = '14a1ddf11d92e44f32b1f993434678b3eafd7718a7a62257eb62c366ffd3028c'
  checksumType = 'sha256'

  silentArgs   = '/install /quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
