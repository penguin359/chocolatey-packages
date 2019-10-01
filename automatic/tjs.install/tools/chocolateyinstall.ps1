$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.10.0/TIB_js-studiocomm_6.10.0_windows_x86_64.exe'
  checksum64     = 'e074557984fdb3aabea98de0c46a7b056ea69eeb61b25c6af89874dd65a724aa'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
