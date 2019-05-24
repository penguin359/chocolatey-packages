$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.murgee.com/auto-mouse-click/download/setup.exe'
  checksum      = 'B39A5D1F3216DBFF66A6CC28D9AC3858B47C4C387821D35DDE34E41C266736E9'
  checksumType  = 'sha256'

  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs