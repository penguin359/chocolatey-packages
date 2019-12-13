$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.11.0/TIB_js-studiocomm_6.11.0_windows_x86_64.exe'
  checksum64     = '16f64434bc139cda2d7c6660421813b7d1aaaf73bf545eac361ac397f6c3bed5'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
