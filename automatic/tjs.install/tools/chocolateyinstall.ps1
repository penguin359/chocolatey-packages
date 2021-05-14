$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.17.0/TIB_js-studiocomm_6.17.0_windows_x86_64.exe'
  checksum64     = '778e052379c5801b65f60dc9f77f4cbad7bdc7eea5c0d02b8eda166662289ce8'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
