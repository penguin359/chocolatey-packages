$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2020.2.0/ttwinclientinstall.exe'
  checksum     = 'accc91e94ab7168d2a0c59ae44c0136e5b5be5b7ed07cae43336518c35ae8b33'
  checksumType = 'sha256'

  silentArgs   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
