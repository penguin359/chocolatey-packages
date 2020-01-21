$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman636build3.exe'
  checksum      = '25ca7c9ff3a6104121b6bf4fb39fd0c5bc76189dc1bc9dfd5a11627cb039d53d'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
