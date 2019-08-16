$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman635build1.exe?b=1&filename=idman635build1.exe'
  checksum      = '944feecacd60e14023e8ea489b9deb001c8d988d95e3440b77e03a9f1cdb6f20'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
