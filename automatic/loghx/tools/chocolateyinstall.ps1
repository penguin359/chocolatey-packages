$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://rx4hx.qrz.ru/files/loghx/LogHX3Setup_build_607.exe'
  checksum      = 'e4da2f6f0c60a5ed7946d73c9140e0a55fd8be13706f73e81371f8fbc81bd8c6'
  checksumType  = 'sha256'

  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
