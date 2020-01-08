$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://update.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'c590cb76e42e688eba2373524c21ba5906b60f5daecba7b3123f2ddda0591e2571acbf02e69caae527c69d887c26d96ec7fcd7f26c741a17fcc43b01753315d9'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
