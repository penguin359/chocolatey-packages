$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman637build11.exe'
  checksum      = 'acf6c082f0569b41f482ec168fa482ea1323cb14418a2df663d377c9490c5803'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
