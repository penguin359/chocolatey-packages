$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.14.0/TIB_js-studiocomm_6.14.0_windows_x86_64.exe'
  checksum64     = 'ab37d2e03e14958a414c6cbbf33cd675040286723a99ef4ce330bfb0ee7e01dd'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
