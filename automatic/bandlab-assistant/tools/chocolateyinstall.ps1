$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.bandlab.com/download/assistant/windows'
  checksum      = '431a1d4cf69de99abc3173efe628f8fd0ab556e245a61f2bf8c6fd6469a83a4670140d87d21836fb0154d1c2b4c8db2765a95b2154c8e3cb172b1fb58c8a24e6'
  checksumType  = 'sha512'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
