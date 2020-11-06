$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.poly.com/content/dam/www/software/PlantronicsHubInstaller.exe'
  checksum     = '47f2f959582a2c63790d7997ba4ce9da283f97976260fe505a8d33e9f047e175'
  checksumType = 'sha256'

  silentArgs   = '/install /quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
