$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://www.epidata.dk/downloads/setup.all-in-one.4.6.0.0.exe'
  checksum     = '781FD9A5474662B1D2CD013E8ACFB7836DD49CD7557A29711386B1F7FE6EE9FC'
  checksumType = 'sha256'

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
