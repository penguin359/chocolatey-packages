$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://github.com/arsenetar/dupeguru/releases/download/4.1.0/dupeGuru_win64_4.1.0.exe'
  checksum     = '2af124ced2b8c8c6da2121dc17f4d116d93cb7a4aa7520d4a49d8e242c4c2d29'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
