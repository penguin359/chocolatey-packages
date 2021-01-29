$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'f797a508beee91933519a71bffe4d1d3ad5c9e86f81ec75324d7cd3cf2e7863b74bdde1e54a3b6cb98c515f5cf99d448519ae507f8bdae9037f423cc8100a113'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
