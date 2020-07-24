$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe'
  checksum     = '98d89beba24ffe466619615269686472f2e886cd8bb646161018bf64bcf77dd1'
  checksumType = 'sha256'
  
  silentArgs   = '-install pf -silent'
}

Install-ChocolateyPackage @packageArgs
