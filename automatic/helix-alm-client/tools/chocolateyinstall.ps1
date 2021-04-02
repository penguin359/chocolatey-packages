$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2021.1.0/ttwinclientinstall.exe'
  checksum     = 'fe4c727c8890bae3120b65aa43bf75a146915f73262456c319b2d1648c0fbdbb'
  checksumType = 'sha256'

  silentArgs   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
