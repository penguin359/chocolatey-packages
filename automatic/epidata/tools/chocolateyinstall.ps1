$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://www.epidata.dk/downloads/setup.all-in-one.4.6.0.6.exe'
  checksum     = 'b8a2e90ce7696c997fa141a8d1abdf439cee445d48d91a2610d7a15486ceee68'
  checksumType = 'sha256'

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
