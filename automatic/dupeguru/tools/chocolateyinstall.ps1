$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/arsenetar/dupeguru/releases/download/4.0.4/dupeGuru_win64_4.0.4.exe'
  checksum      = '72637b8d526d97c7b1836857f4012de831a07b3f156028b1b854f1e6e6fd1d84'
  checksumType  = 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
