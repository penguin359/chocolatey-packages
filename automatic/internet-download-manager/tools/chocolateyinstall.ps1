$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman633build3.exe'
  checksum      = '5bcd5ba46297289dc32184ad1ba9dd141bf39ad013e9afdfca2e2fd0781c9ce5'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs