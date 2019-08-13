$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://physics.princeton.edu/pulsar/k1jt/wsjtx-2.1.0-win32.exe'
  checksum     = 'CF964C8E8DBBD5BD11753B60D71A301A1042CB4E9631E944DFBA9D9D69345EE6'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
