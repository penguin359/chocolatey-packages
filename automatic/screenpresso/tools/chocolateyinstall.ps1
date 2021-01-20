$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe'
  checksum     = '16e01dcf6845d8f59a4069410c3881fb3a168bd3177b89390a9708d198597ee8'  
  checksumType = 'sha256'

  silentArgs   = '-install pf -silent'
}

Install-ChocolateyPackage @packageArgs
