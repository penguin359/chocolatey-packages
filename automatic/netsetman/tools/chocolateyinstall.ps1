$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.netsetman.com/download.php'
  checksum      = 'B20DBE643255CCDA656BA898E0B17AF08D32DE307864F781BB466621F3738EAF'
  checksumType  = 'sha256'

  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs