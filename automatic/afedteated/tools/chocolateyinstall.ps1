$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '6203f873521f9ed150391713a9f83e7f83af687d9387e7f110c9e5822009b29a4e7ba5a369058fcba59334845415cf00e9c6bc4f69f6237a2023b49bd805c305'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
