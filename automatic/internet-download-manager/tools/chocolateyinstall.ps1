$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman635build10.exe?b=1&filename=idman635build10.exe'
  checksum      = 'f3d32fcd15ee979e2ba3d92690ec3e8880d26e3ba1e6c1ff11df186606ab6ca6'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
