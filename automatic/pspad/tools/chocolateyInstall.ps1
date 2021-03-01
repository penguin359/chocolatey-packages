$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PSPad editor'
  fileType       = 'exe'

  url            = 'https://www.pspad.com/files/pspad/pspad505_setup.exe'
  checksum       = '63db0be75d38be92e5f9000c2ad73b7f62c8db9d33c4504785bfe348c5318314'
  checksumType   = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
