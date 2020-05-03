$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman637build14.exe'
  checksum      = 'fcb83024e4388db05b0b0b25b340617cb0900cf02c6ddab269bccba2b8037e50'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
