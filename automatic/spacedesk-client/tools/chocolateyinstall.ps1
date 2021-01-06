$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://spacedesk.net/downloads/spacedeskWindowsVIEWER_v0930_BETA.msi'
  checksum      = '2c6aaf3404054ce9b3a1e577f4aafad3b47c12732af83c1dcd5337d15266ca69'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
