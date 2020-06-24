$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.13.0/TIB_js-studiocomm_6.13.0_windows_x86_64.exe'
  checksum64     = '0642f39d1161fdec2347b6eb6ca2474e259c6866a9260d508ec2071479972caf'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
