$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman637build15.exe'
  checksum      = 'e9fcb2ddc9b576acda5e85a7d164c1bfc4ad677e371419ae111e7234d4d3aaf7'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
