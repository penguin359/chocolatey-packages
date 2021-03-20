$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url            = 'https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe'
  checksum       = 'b712c8e9f4da6e3c70a76e572131cdf9e585c82298df028619c0ae3293d3bc89'  
  checksumType   = 'sha256'

  silentArgs     = '-install pf -silent'
  validExitCodes = @(0, 4)
}

Install-ChocolateyPackage @packageArgs
