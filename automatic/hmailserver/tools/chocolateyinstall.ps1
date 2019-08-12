$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url          = 'https://www.hmailserver.com/files/hMailServer-5.6.7-B2425.exe'
  checksum     = '761B20B8B077392699F4A3A2C80155587C6109F6CDD600692890DCA9BFE39DD3'
  checksumType = 'sha256'

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs