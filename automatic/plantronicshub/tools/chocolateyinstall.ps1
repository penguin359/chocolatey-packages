$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.poly.com/content/dam/www/software/PlantronicsHubInstaller.exe'
  checksum     = '06e6b55fd2befa3e0a73d33f53bb76f3199f047c2ca9d774804b2982ba105ee9'
  checksumType = 'sha256'

  silentArgs   = '/install /quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
