$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.skytopia.com/software/sunsetscreen/SunsetScreen_Setup.exe'
  checksum     = '0963a5473707794ec5b90dc6779b349dfea107c898a5be0cb16697ce7c69cbb5'
  checksumType = 'sha256'

  silentArgs   = "-q"
}

Install-ChocolateyPackage @packageArgs
