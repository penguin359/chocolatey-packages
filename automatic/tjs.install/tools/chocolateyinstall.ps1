$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.15.0/TIB_js-studiocomm_6.15.0_windows_x86_64.exe'
  checksum64     = 'e1e38f31dbabc890e21ad27d8e448dd6ea979242c525ebeced81885081742222'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
