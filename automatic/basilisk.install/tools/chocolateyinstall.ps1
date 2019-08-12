$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://eu.basilisk-browser.org/release/basilisk-latest.win32.installer.exe'
  checksum       = 'e7b1fae9ee0953921aeeee31ab87bca049139963e1c52b22ff282f793acd03dd'
  checksumType   = 'sha256'

  url64          = 'https://eu.basilisk-browser.org/release/basilisk-latest.win64.installer.exe'
  checksum64     = 'b4e7deab74c5df327e26c074f3a7519863764859ab4694a2e962d3defcda1b65'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
