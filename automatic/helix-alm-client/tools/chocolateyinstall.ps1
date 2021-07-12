$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2021.2.0/ttwinclientinstall.exe'
  checksum     = '43b689192d41b1aa4b96b60f523ae78b5813ec03cd11712f3bfc66635e2340fb'
  checksumType = 'sha256'

  silentArgs   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
