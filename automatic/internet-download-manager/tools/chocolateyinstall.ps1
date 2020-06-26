$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman637build16.exe'
  checksum      = 'cad935918362bbb23283ffa45fdc39cf2101cba3171c5eceb00c15207c79bf4a'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
