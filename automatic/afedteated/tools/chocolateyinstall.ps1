$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '731b1a65197efd7a53e5f3395975d78ce19b7a79481661bcc6fb4bb058a6ec4f79df3289c1e871fd9554a89ccab67d66205bb7cc8a24358cf29b57822f2d6fc6'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
