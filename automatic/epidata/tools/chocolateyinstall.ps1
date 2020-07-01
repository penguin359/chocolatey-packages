$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'http://www.epidata.dk/downloads/setup.all-in-one.4.6.0.5.exe'
  checksum     = '42f11c2eea70344bdec46d470f2ea61a08d570f5f215a46e059d8d9724bb7cd6'
  checksumType = 'sha256'

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
