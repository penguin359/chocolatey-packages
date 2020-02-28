$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.plantronics.com/content/dam/plantronics/software/PlantronicsHubInstaller.exe'
  checksum     = '9c2c9bc4f4b1ba1d07e89243f98d0d49d7b52397c358380cf14598baf1d58370'
  checksumType = 'sha256'

  silentArgs   = '/install /quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
