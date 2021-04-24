$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/clipto-pro/Desktop/releases/download/v5.0.3/clipto-5.0.3.exe'
  checksum     = 'b6a0cc159d21b85e06c15b9789714aa3a17022ce4e419e997189164ea7f78fba'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
