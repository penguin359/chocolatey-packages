$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com/arsenetar/dupeguru/releases/download/4.0.3-InstallFix/dupeGuru_win64_4.0.3.exe'
  checksum      = '1BFE7FD2E619D39A51DB3256692219BD4445A785111FA4A7ABCDEF8B9879B120'
  checksumType  = 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs