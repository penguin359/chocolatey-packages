$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url            = 'https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe'
  checksum       = '3AFFB1C2600429B0F4F017C4114490CABCDA7FE5014A6D7268F005ACD7B047AB'
  checksumType   = 'sha256'

  silentArgs     = '-install pf -silent'
  validExitCodes = @(0, 4)
}

Install-ChocolateyPackage @packageArgs