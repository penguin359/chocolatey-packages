$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.plantronics.com/content/dam/plantronics/software/PlantronicsHubInstaller.exe'
  checksum     = 'D244626858BC8AACC96457D68B1705ABE6AA720F5C09AAFAE3CF30FB86E8B84B'
  checksumType = 'sha256'

  silentArgs   = '/install /quiet /norestart'
}

Install-ChocolateyPackage @packageArgs