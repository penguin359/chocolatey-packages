$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://update.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '2192ad46f8181fdc020a5c84a17243454fca8099405cf091070afae41feadb6497271597ac8704806a2c2bd73ee2e7e85e88b74c4c29c745cf67c7a0e533c633'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
