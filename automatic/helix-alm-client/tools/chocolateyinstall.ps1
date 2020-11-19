$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2020.3.0/ttwinclientinstall.exe'
  checksum     = 'f1343d777d9b2273e71de82bd0a4302d4714f9c13130b93a068968d960e5be8b'
  checksumType = 'sha256'

  silentArgs   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
