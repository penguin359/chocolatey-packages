$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2020.2-Setup.exe'
  checksum      = '6f6786dbda092375aebddc21e7a2a5415c16629654fa60a90a86c8302eaf67b8'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
