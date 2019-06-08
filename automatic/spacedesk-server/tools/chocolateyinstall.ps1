$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_10_32_v0918_BETA.msi'
  checksum      = '67E01CAA6DDF8168A23B1631E888B3672A1937C6028E95EED3CA61F79389E1BD'
  checksumType  = 'sha256'

  url64bit      = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_10_64_v0918_BETA.msi'
  checksum64    = '5F588A1FB04F1C44F58C7679BA8794FF3CC8803BB544A06AC19A9231E68CF736'
  checksumType64= 'sha256'

  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs