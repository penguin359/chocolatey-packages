$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman638build10.exe'
  checksum      = 'ff9c394bbeb08124d5da877b1e3d1d242aaf364093ddc47c2dd4ab24e99ec364'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
