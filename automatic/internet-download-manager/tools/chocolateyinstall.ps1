$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman638build15.exe'
  checksum      = 'ee71a714bcc6e24ba53ae5b0ce4b8e6540322ee0c253499f68090933029aca96'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
