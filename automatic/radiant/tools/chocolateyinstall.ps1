$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-5.0.2-Setup.exe'
  checksum      = 'c19505559005da14faeaa9e147f6cac3556546c1eba76c0168234351150f486d'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
