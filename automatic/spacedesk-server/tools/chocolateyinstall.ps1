$ErrorActionPreference = 'Stop';

if ( [environment]::OSVersion.Version.Major -ge 10 )  {
  $url32_win10      = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_10_32_v0930_BETA.msi'
  $checksum32_win10 = '0B2D6E3350FE3E7081ACDF8641D2B4F03C837C71CE34CDF8A6A99FDD91797032'
  $url32            = $url32_win10
  $checksum32       = $checksum32_win10
  $url64_win10      = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_10_64_v0930_BETA.msi'
  $checksum64_win10 = '8B5F31D736BA1636B53FA62A630A059F98CECFC3708FDE032606C85D9B4A6FCA'
  $url64            = $url64_win10
  $checksum64       = $checksum64_win10
} elseif ( [environment]::OSVersion.Version.Major -ge 7 ) {
  $url32_win7_81      = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_7_32_v0930_BETA.msi'
  $checksum32_win7_81 = 'e8c71576fba5ebcf2181903d1f6d5f00f14c271a63cbfdc63516880050937159'
  $url32              = $url32_win7_81
  $checksum32         = $checksum32_win7_81
  $url64_win7_81      = 'https://spacedesk.datronic.de/download/spacedesk_driver_Win_7_64_v0930_BETA.msi'
  $checksum64_win7_81 = 'a9db0dad979e0f3b2c7c5dfd765b5953e530e5a5b360c2a7d46f8b5005c590fb'
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
