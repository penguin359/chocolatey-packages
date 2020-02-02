$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://mirror2.internetdownloadmanager.com/idman636build5.exe'
  checksum      = '4bb1238a983210a638afaa46497b34f8d8a2d5aa9ecbf5e6faa92c0cec4d2db1'
  checksumType  = 'sha256'

  silentArgs	= "/skipdlgs"
}

Install-ChocolateyPackage @packageArgs
