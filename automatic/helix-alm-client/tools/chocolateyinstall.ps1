$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2020.1.0/ttwinclientinstall.exe'
  checksum     = '9e2976bb940e38faa2c20be186f389e5f0b6528cc22b64a50d4d15462ba9bccd'
  checksumType = 'sha256'

  silentArgs   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
