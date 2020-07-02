$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://update.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '7c9cb2ec898c6239ec49e028e5584414fd6d81b3c867a99014e29dc32868eb3c93a77314975eb91e49e8b7be2326c8f53b60c058dec955cee5b8d51d0a86f9c2'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
