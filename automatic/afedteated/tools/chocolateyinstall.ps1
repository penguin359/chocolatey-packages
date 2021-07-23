$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'e297b3cbffcd69da5af411b4a61dee7ea5563124671d7e1e3642af836bd18ab09c542f5b2f2ee9e8bb2a89ce5311b5a21877d5b84049079362fbb31d79f09256'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
