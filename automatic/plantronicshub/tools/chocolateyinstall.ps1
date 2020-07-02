$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.poly.com/content/dam/www/software/PlantronicsHubInstaller.exe'
  checksum     = 'd45d46c1f336caf9f2b5a96fffffc1b574ddb383d90c8a3fa3ac6cc3a4a97c43'
  checksumType = 'sha256'

  silentArgs   = '/install /quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
