$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman635build15.exe?b=1&filename=idman635build15.exe'
  checksum      = 'd7fa961d3a0d081b91c8ed88a5530243d984721ae01741e2dd1ce8c33ae18b92'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
