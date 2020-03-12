$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://update.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '487e9d3a6bfd5e219f2b107dc8347f3e0f27ff45a1365a322f43e5f34de641b02d114fd8ea739ec7b50078894385ee0e9547c3d66e2a673a34cd52fe7d98ad91'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
