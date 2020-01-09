$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://www.epidata.dk/downloads/setup.all-in-one.4.6.0.2.exe'
  checksum     = 'f69bd8616eed4de89acb789b5bee6bcc2c5fc8f961ea02d0361926dba044afc5'
  checksumType = 'sha256'

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
