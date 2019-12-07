$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://www.kafkatool.com/download2/kafkatool.exe'
  checksum      = '6b49469afa27a12b157636e60fc311f5d193f2a1f4ad0786d378980ebede96d0'
  checksumType  = 'sha256'

  url64bit      = 'http://www.kafkatool.com/download2/kafkatool_64bit.exe'
  checksum64    = 'c1c49b4fbd2b4f34bf002db1d8a757040cfe3e534e185868a8a0eb7edcba1c96'
  checksumType64= 'sha256'

  silentArgs    = "-q"
}

Install-ChocolateyPackage @packageArgs
