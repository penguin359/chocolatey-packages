$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://github.com/arsenetar/dupeguru/releases/download/4.1.1/dupeGuru_win64_4.1.1.exe'
  checksum     = '26f3fbfd2138ada0c3e5213255a5605c52746fd98f66ae32963203f291d892b7'
  checksumType = 'sha256'

  silentArgs   = "/S"
}

Install-ChocolateyPackage @packageArgs
