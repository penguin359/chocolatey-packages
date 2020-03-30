$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://spacedesk.net/downloads/spacedeskWindowsVIEWER_v0921_BETA.msi'
  checksum      = '29367073721b37adcf8f70e95e1656b72dd39509ccf2dd83bb323d7f0eeac134'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
