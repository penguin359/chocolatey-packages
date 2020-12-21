$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'ec3a9c6d8e27488dcdf678db95aa6084af737074ee4fefcf0a4859388ed4228a7108ab5b39a906d76c2609f79dcddf3f70508c87879c5822d4e4d4ee87571aee'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
