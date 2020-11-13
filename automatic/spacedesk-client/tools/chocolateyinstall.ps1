$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://spacedesk.net/downloads/spacedeskWindowsVIEWER_v0928_BETA.msi'
  checksum      = '6d920c68cad6fae9b0e325acd8c35acaa54968d52a08a1d59c64b083080fe6de'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
