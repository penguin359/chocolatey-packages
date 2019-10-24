$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman635build7.exe?b=1&filename=idman635build7.exe'
  checksum      = '7331a8edbcb6135fdc1fb3a6d0c914d41cac5c2c147481e9978e368eee30bd23'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
