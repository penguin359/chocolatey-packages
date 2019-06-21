$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/arsenetar/dupeguru/releases/download/4.0.4/dupeGuru_win64_4.0.4.exe'
  checksum      = '72637B8D526D97C7B1836857F4012DE831A07B3F156028B1B854F1E6E6FD1D84'
  checksumType  = 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
