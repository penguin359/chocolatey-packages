$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://spacedesk.datronic.de/download/spacedeskWindowsVIEWER_v0919_BETA.msi'
  checksum      = 'd8f2b089b9cd48a631667b5fc77596c05d56c0bd24f5ccf78ff8b386bc7f4922'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
