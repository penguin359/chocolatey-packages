$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman635build14.exe?b=1&filename=idman635build14.exe'
  checksum      = '50f4f407727fc5f083ee68f6052bc4480f4db0ce823cb73a27ec41a355821362'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
