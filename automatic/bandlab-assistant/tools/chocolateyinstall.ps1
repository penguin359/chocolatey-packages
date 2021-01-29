$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.bandlab.com/download/assistant/windows'
  checksum      = '86da04a9a6ca75f3362c8daf1a93d0eb9f58cb95e17329065dca5dd95b2f04556468482d8ab6f2ed0fde522d0e17e0d29d02b06a8d8955e46418c70e61acd3f5'
  checksumType  = 'sha512'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
