$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman638build5.exe'
  checksum      = '70f57e91cbd07d1c2b0183b529bd613e4862b41ceab56e4e705fecfb15bf73ca'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
