$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2020.3.1/ttwinclientinstall.exe'
  checksum     = '161caeb04cc53cb1c34d46a9a92fbf10d31630c787218f96b3b37428c4dfedb4'
  checksumType = 'sha256'

  silentArgs   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
