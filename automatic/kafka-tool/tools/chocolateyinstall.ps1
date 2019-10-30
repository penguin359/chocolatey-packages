$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'http://www.kafkatool.com/download2/kafkatool.exe'
  checksum      = '5ad9cf76b0ded44b674f4a38e3019f1b782dc83df58d51c5d14a09375b7c58ce'
  checksumType  = 'sha256'

  url64bit      = 'http://www.kafkatool.com/download2/kafkatool_64bit.exe'
  checksum64    = 'acd6cf1474085a1091188f09ae866b6a7c0cd7f6c0d50c32d3a6b1af9b620baf'
  checksumType64= 'sha256'

  silentArgs    = "-q"
}

Install-ChocolateyPackage @packageArgs
