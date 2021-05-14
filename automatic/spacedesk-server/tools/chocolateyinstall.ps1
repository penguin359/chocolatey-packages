$ErrorActionPreference = 'Stop';

if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url32_win10      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_10_32_v0997_BETA.msi'
  $checksum32_win10 = ''
  $url32            = $url32_win10
  $checksum32       = $checksum32_win10
  $url64_win10      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_10_64_v0997_BETA.msi'
  $checksum64_win10 = ''
  $url64            = $url64_win10
  $checksum64       = $checksum64_win10
} elseif ( ( [environment]::OSVersion.Version.Major -ge 7 ) -or
           ( ( [environment]::OSVersion.Version.Major -eq 6 ) -and
             ( [environment]::OSVersion.Version.Minor -eq 1 ) ) ) {
  $url32_win7_81      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_8.1_32_v0994_BETA.msi'
  $checksum32_win7_81 = 'c76dbcae200d83af8808f2c713bf31c7d066440860850e3339b0c7bfecf6218e'
  $url32              = $url32_win7_81
  $checksum32         = $checksum32_win7_81
  $url64_win7_81      = 'https://spacedesk.net/downloads/spacedesk_driver_Win_8.1_64_v0994_BETA.msi'
  $checksum64_win7_81 = '862caf3bd7e4a2c688499ae88b3f041a8672f4734d183408bca8e002adee5f8c'
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
