$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdist2.perforce.com/alm/helixalm/r2019.5.0/ttwinclientinstall.exe'
  checksum     = 'd33d35d20b0d61fd0a47f11514926132ee461fcfc09a571ad2cb04c399587f5e'
  checksumType = 'sha256'

  silentArgs   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
