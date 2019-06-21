$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://spacedesk.datronic.de/download/spacedeskWindowsVIEWER_v0916_BETA.msi'
  checksum      = '72FB111E827F912A2E442CDE836C2EB7C979E9C999F8E7D4C4ADC1A7A346B5CE'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs