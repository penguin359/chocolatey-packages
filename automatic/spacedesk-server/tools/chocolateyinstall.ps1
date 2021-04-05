$ErrorActionPreference = 'Stop';

if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url32_win10      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_10_32_v0990_BETA.msi'
  $checksum32_win10 = ''
  $url32            = $url32_win10
  $checksum32       = $checksum32_win10
  $url64_win10      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_10_64_v0990_BETA.msi'
  $checksum64_win10 = ''
  $url64            = $url64_win10
  $checksum64       = $checksum64_win10
} elseif ( ( [environment]::OSVersion.Version.Major -ge 7 ) -or
           ( ( [environment]::OSVersion.Version.Major -eq 6 ) -and
             ( [environment]::OSVersion.Version.Minor -eq 1 ) ) ) {
  $url32_win7_81      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_8.1_32_v0989_BETA.msi'
  $checksum32_win7_81 = 'abb51936edfe46b377a62d99569e09938bb3618494a636fa8fc2354b3c11f73c'
  $url32              = $url32_win7_81
  $checksum32         = $checksum32_win7_81
  $url64_win7_81      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_8.1_64_v0989_BETA.msi'
  $checksum64_win7_81 = '89119dee9f4a71ff2d07b5efbddf81dbe965ffe4d87a224e2fae5b47b423d149'
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
