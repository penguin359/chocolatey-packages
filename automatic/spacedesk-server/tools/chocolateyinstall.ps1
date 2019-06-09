$ErrorActionPreference = 'Stop';

if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url32_win10      = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_10_32_v0918_BETA.msi'
  $checksum32_win10 = '67E01CAA6DDF8168A23B1631E888B3672A1937C6028E95EED3CA61F79389E1BD'
  $url32            = $url32_win10
  $checksum32       = $checksum32_win10
  $url64_win10      = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_10_64_v0918_BETA.msi'
  $checksum64_win10 = '5F588A1FB04F1C44F58C7679BA8794FF3CC8803BB544A06AC19A9231E68CF736'
  $url64            = $url64_win10
  $checksum64       = $checksum64_win10
} else {
  $url32_win7_81      = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_7_32_v0918_BETA.msi'
  $checksum32_win7_81 = '8e35d2bdace28a7314f4e120666a7190f69b2f404349210d95320b3f4d3df0bc'
  $url32              = $url32_win7_81
  $checksum32         = $checksum32_win7_81
  $url64_win10        = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_7_64_v0918_BETA.msi'
  $checksum64_win7_81 = 'f658eb615555755dd65802655f87929a9a5c4ae0890ba463e255972404b94716'
  $url64              = $url64_win7_81
  $checksum64         = $checksum64_win7_81
  
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filetype      = 'MSI'

  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'

  url64bit      = $url64
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs	= "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs