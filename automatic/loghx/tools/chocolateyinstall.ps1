$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://rx4hx.qrz.ru/files/loghx/LogHX3Setup_build_643.exe'
  checksum      = 'cb65af566acec8d5843cfbd39c06725dc3856bed6763066e65db663a32c4def1'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
