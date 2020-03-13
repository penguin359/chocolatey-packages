$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.plantronics.com/content/dam/plantronics/software/PlantronicsHubInstaller.exe'
  checksum     = '0d8dae9fdd69f9b73cf3e243f6782a5ebb16fe772a9ab6691ab0fdd35584aeae'
  checksumType = 'sha256'

  silentArgs   = '/install /quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
