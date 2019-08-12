$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.9.0/TIB_js-studiocomm_6.9.0_windows_x86_64.exe'
  checksum64     = 'AE4DB5E07481D8CEB48D2A4346963EC4EB7155BAD79A6B7757CC5C363CBBB2EC'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs