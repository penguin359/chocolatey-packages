$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman637build12.exe'
  checksum      = 'b8d33d6c7d0cd7c7f13cbdf0af79e8b83e2eecc3ccc5c148a34b654ec5b5c0e2'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
