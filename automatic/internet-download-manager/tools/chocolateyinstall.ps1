$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman635build2.exe?b=1&filename=idman635build2.exe'
  checksum      = '0590c470c7fe7c53001555c131caddb21d4b5d0cb4fb34a884854dfeb88ae46f'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
