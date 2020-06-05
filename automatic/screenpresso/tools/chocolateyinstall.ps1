$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe'
  checksum     = '258344038bc027a330d54a52bd2252bda7523ed4862869cb14dc075334d26721'
  checksumType = 'sha256'
  
  silentArgs   = '-install pf -silent'
}

Install-ChocolateyPackage @packageArgs
