$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman633build2.exe'
  checksum      = '98F7C90403F2C9844962BC8C4E7CEE0C5928DA018B30802A6242E9B3B0559F47'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs