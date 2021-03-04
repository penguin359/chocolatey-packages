$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url            = 'https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe'
  checksum       = '0366d6593a1a4cfa58b17ba504013ca77493c501199943e3a7cea1e73ae23760'  
  checksumType   = 'sha256'

  silentArgs     = '-install pf -silent'
  validExitCodes = @(0, 4)
}

Install-ChocolateyPackage @packageArgs
