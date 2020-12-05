$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'd66647248e60ee42b41dad07295d8602f5c229f6733b8dc898148e11a6e06d4c3a7eb132bed2f1d0e2c878eb6345d3060f0e15c0e8d5ce0824d3f23630d847db'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
