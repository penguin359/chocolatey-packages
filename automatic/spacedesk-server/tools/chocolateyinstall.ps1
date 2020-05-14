$ErrorActionPreference = 'Stop';

if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url32_win10      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_10_32_v0939_BETA.msi'
  $checksum32_win10 = ''
  $url32            = $url32_win10
  $checksum32       = $checksum32_win10
  $url64_win10      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_10_64_v0939_BETA.msi'
  $checksum64_win10 = ''
  $url64            = $url64_win10
  $checksum64       = $checksum64_win10
} elseif ( [environment]::OSVersion.Version.Major -ge 7 ) {
  $url32_win7_81      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_7_32_v0939_BETA.msi'
  $checksum32_win7_81 = '1ced79de4a957277a7e179b1e242cd374be5f49cec7327e30c38dba80d08c7d5'
  $url32              = $url32_win7_81
  $checksum32         = $checksum32_win7_81
  $url64_win7_81      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_7_64_v0939_BETA.msi'
  $checksum64_win7_81 = '48a17fb8360a79b91df35733d7bda80fe66859c0a8d89c4db140b2d72ea7e743'
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
