$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://update.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'a25502f6ef3fa776c56f3716190fba9286c805cad1817065e6b653016930ecc58df80545e52406f920d3f8f812eb836e6dac6477aa38e523788cdd608041445b'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
