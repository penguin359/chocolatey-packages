$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe'
  checksum     = 'c7767deb817984cb8d15a2e1a70b23d67dadf422e6df4cf66f42886184a8a0ab'  
  checksumType = 'sha256'

  silentArgs   = '-install pf -silent'
}

Install-ChocolateyPackage @packageArgs
