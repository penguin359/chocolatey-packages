$ErrorActionPreference = 'Stop';

if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url32_win10      = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_10_32_v0919_BETA.msi'
  $checksum32_win10 = '3CE26195DA8773F4BCB0EBA98B35FFFC88E7DE3A9F11D10914C59A23B9C872A7'
  $url32            = $url32_win10
  $checksum32       = $checksum32_win10
  $url64_win10      = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_10_64_v0919_BETA.msi'
  $checksum64_win10 = 'E074797A35D121F306492F17CD4959F217C90C7074D45DAEA6AF593F284329AB'
  $url64            = $url64_win10
  $checksum64       = $checksum64_win10
} elseif ( [environment]::OSVersion.Version.Major -ge 7 ) {
  $url32_win7_81      = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_7_32_v0919_BETA.msi'
  $checksum32_win7_81 = 'd2e52f73734dafc20705568678569efc9cb509608d1893fd753c18f4a54745aa'
  $url32              = $url32_win7_81
  $checksum32         = $checksum32_win7_81
  $url64_win7_81      = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_7_64_v0919_BETA.msi'
  $checksum64_win7_81 = '8fc9c350eb76b1ca38296e3ad7cd4f2b0729b44ac635686a60ccc7c68d08d8f7'
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
