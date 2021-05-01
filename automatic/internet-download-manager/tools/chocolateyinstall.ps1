$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman638build22.exe'
  checksum      = 'd1b35093012c35102c90d2c4ec696d385a18f78ec56e7d61c0ebe8bb08a2803b'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
