$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.dropbox.com/s/1snbldc75h8j2zo/GridTracker-Installer.1.20.0927.exe?dl=1'
  checksum     = '213503faa2c3b52efd26a5fa8b1cd9f7b039c6aab4502265061c8090be0cc32e'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs