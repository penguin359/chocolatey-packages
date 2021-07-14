$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman639build1.exe'
  checksum      = '19a2d658a2fa7286c039fc84bcdd68dec0b00fa5eea4203cad9901b83604edf8'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
