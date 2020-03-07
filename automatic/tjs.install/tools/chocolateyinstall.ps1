$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.12.0/TIB_js-studiocomm_6.12.0_windows_x86_64.exe'
  checksum64     = '061fde419c1baa2abc5a29a34502dc1d9610e2d37151952c6f708dfac6ceecea'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
