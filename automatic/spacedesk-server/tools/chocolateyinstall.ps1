$ErrorActionPreference = 'Stop';

if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url32_win10      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_10_32_v0977_BETA.msi'
  $checksum32_win10 = ''
  $url32            = $url32_win10
  $checksum32       = $checksum32_win10
  $url64_win10      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_10_64_v0977_BETA.msi'
  $checksum64_win10 = ''
  $url64            = $url64_win10
  $checksum64       = $checksum64_win10
} elseif ( [environment]::OSVersion.Version.Major -ge 7 ) {
  $url32_win7_81      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_8.1_32_v0973_BETA.msi'
  $checksum32_win7_81 = '48091a45254436440855b6e6c911690236cf2e90a466518bdab42f12cedd99f8'
  $url32              = $url32_win7_81
  $checksum32         = $checksum32_win7_81
  $url64_win7_81      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_8.1_64_v0973_BETA.msi'
  $checksum64_win7_81 = '6b96d6a38b3c77e1cc2626239e0e8e5c7fcf004e7bf973f7169d174b116daace'
  $url64              = $url64_win7_81
  $checksum64         = $checksum64_win7_81  
} else {
  throw "spacedesk-server runs only with Windows 10, windows 8.1 and windows 7."
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  filetype       = 'MSI'

  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'

  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'

  silentArgs	   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
