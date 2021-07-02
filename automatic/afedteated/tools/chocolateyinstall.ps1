$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '911b59101d5e18c9e9581a7906bf21df82f61453f6914217a80a62f7274c5d7d7bfd3ef8085be55044d3ba98d4110f26aacd5bd8b836ff277164c85ff508e24f'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
