$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2019.3.0/ttwinclientinstall.exe'
  checksum     = '8877d267f1103b20548b54132bfbf9d5d1ab7b888c6966cb78fe07f068ab30a9'
  checksumType = 'sha256'
  
  silentArgs   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
