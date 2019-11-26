$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if ( [environment]::OSVersion.Version.Major -ge 10 )  {
    $url_win10      = 'https://build.openvpn.net/downloads/releases/tap-windows-9.24.2-I601-Win10.exe'
    $checksum_win10 = '1782d56568092e8fba575fe7e11b2e86f04518f40a18a4ce594bd1209e0cb547'
    $url            = $url_win10
    $checksum       = $checksum_win10
} else {
  $url_others     = 'https://build.openvpn.net/downloads/releases/tap-windows-9.24.2-I601-Win7.exe'
  $checksum_others= '35cfa71fe2952192c13cbbd8a2f3f62a6486af406008e654646ea1d823928d46'
  $url            = $url_others
  $checksum       = $checksum_others
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = "$url"
  checksum      = "$checksum"
  checksumType  = 'sha256'

  silentArgs	= '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
