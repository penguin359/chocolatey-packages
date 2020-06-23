$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://www.screenpresso.com/binaries/releases/stable/dotnet47/Screenpresso.exe'
  checksum     = '4403adef0fee961ed47c915896706de6c200560fc3feedf4415207e8bc28c79c'
  checksumType = 'sha256'
  
  silentArgs   = '-install pf -silent'
}

Install-ChocolateyPackage @packageArgs
