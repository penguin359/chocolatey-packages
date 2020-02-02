$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://update.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '89481ed1ab97e8f4b6206aeecc7400074fd1d9c5c120c19f40fa1e048d2ac504e9f75af4893a772fc6d94e1ad626ecbe5ed8665daa24c2eefb3baf0ca0fabb02'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
