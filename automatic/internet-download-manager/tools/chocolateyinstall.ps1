$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman635build12.exe?b=1&filename=idman635build12.exe'
  checksum      = '1251534a74070ec56fe4dc869e545e5d45ae10f3aec48238c3e63b3a8e3dee9e'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
