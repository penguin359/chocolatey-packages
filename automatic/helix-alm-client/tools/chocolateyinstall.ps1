$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2019.4.0/ttwinclientinstall.exe'
  checksum     = 'be02a21065a497411d4ad0d2078db918f0da17472fedd5837f4c8cc3263f7f77'
  checksumType = 'sha256'

  silentArgs   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
