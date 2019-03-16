$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$( Split-Path -Parent $MyInvocation.MyCommand.Definition )"
  fileType       = 'exe'
  url            = 'http://pspad.poradna.net/release/pspad501_setup.exe'
  checksum       = 'DBBD1B7044D925744FE9A873C181CAA2F6F931E02BB316C1A9D08659110C7BDD'
  checksumType   = 'sha256'

  skipShims      = @('phpCB.exe', 'TiDy.exe')
  softwareName   = 'PSPad editor'
  
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

foreach ($file in $packageArgs.skipShims) {
  New-Item -Path $packageArgs.unzipLocation -Name "$file.ignore" -Type file -Force | 
      Out-Null
}

Install-ChocolateyPackage @packageArgs
rm $toolsDir\pspad*setup.exe -EA 0