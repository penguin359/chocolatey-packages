$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe'
  checksum     = '43e3325d417add29a33c1e3a3a701fa2aa24e660694ceeead7a460841cd58886'  
  checksumType = 'sha256'

  silentArgs   = '-install pf -silent'
}

Install-ChocolateyPackage @packageArgs
