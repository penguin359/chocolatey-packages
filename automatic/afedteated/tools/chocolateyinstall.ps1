$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '282dbdde8664caf51d018abbb3b673dff05803c241b5e051b7812533e91e99510a5a8add3163a93f7cca2ff6cb354d83f3a57ea97b6b8ab9546b1639f2a4e9b7'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
