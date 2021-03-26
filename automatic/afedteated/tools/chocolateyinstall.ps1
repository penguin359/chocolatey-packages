$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '3498665de315b4650dd8e45f522e58a4e713f742e3ddb9037482679f0269e296680db5b6acd43c2b55dc73bbb0a254001cb1e3d8c2e62af38948c2e88b8c2cca'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
