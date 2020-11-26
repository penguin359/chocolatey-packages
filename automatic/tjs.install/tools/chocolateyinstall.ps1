$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.16.0/TIB_js-studiocomm_6.16.0_windows_x86_64.exe'
  checksum64     = '8c79492796a02dc944d39f700a5d7252512016f683dc8d097196559a3f8a7869'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
