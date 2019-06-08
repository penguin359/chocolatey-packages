$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://spacedesk.datronic.de/download/spacedeskWindowsVIEWER_v0915_BETA.msi'
  checksum      = '952607dd90da95d21663034074316520bde880402a845ae183f09e9045af1c88'
  checksumType  = 'sha256'

  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs