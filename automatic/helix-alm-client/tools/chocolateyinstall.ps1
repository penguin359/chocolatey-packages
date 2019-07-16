$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://cdist2.perforce.com/alm/helixalm/r2019.2.1/ttwinclientinstall.exe'
  checksum      = '426AD105459E94BFAC220DAFD6D5D99F4E4170AEE6C2E2E08881AFDA185908B2'
  checksumType  = 'sha256'
  
  silentArgs    = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs