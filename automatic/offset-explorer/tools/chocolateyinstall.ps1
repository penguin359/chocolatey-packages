$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.kafkatool.com/download2/offsetexplorer.exe'
  checksum      = 'bf6182d8342ce51219e71bd1135f16d3c44564d3d6945734d96453bdb961c7bd'
  checksumType  = 'sha256'

  url64bit      = 'https://www.kafkatool.com/download2/offsetexplorer_64bit.exe'
  checksum64    = 'ac2fdff02e69a4e3d27efea8cd629f6360029c3e6df4830f71032154c43f3dc9'
  checksumType64= 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs
