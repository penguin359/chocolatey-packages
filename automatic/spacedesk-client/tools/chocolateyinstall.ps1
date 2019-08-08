$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://spacedesk.datronic.de/download/spacedeskWindowsVIEWER_v0917_BETA.msi'
  checksum      = 'bea5c897f1bd2336bf4e1e429344f510f944b2fee9cf22fe89a088ce3debc3b4'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
