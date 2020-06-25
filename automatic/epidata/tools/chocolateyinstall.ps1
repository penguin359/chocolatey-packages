$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://www.epidata.dk/downloads/setup.all-in-one.4.6.0.4.exe'
  checksum     = 'f9c1df380097c63ef2de2e322a5f231389135ad1f213aad65f82ffad07ab8247'
  checksumType = 'sha256'

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
