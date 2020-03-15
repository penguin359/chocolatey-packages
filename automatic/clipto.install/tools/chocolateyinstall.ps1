$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/clipto-pro/Desktop/releases/download/v2.4.6/clipto-2.4.6.exe'
  checksum     = 'feebe91ed580b5e0af3fbfb67ab94ad66eb7a820eceaad778d6ecee7bf31cb38'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs