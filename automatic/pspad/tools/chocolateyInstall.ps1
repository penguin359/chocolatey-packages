$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PSPad editor'
  unzipLocation  = "$( Split-Path -Parent $MyInvocation.MyCommand.Definition )"
  fileType       = 'exe'

  url            = 'http://pspad.poradna.net/release/pspad501_setup.exe'
  checksum       = 'DBBD1B7044D925744FE9A873C181CAA2F6F931E02BB316C1A9D08659110C7BDD'
  checksumType   = 'sha256'
  
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
rm $toolsDir\pspad*setup.exe -EA 0