$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url            = 'https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe'
  checksum       = '7e1bbaba8f3cc27f558af66c935b2160887b52f622d95ff459d54748d293cc45'  
  checksumType   = 'sha256'

  silentArgs     = '-install pf -silent'
  validExitCodes = @(0, 4)
}

Install-ChocolateyPackage @packageArgs
