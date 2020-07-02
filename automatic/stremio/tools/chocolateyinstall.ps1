$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://dl.strem.io/win/v4.4.106/Stremio+4.4.106.exe'
  checksum     = 'a1d8ef3cdab9ddbff6eda702677288e5df106f0feb369661395ebc5c2c691aa9'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs