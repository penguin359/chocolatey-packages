$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PSPad editor'
  fileType       = 'exe'

  url            = 'https://www.pspad.com/files/pspad/pspad503_setup.exe'
  checksum       = '8eee101740b5151ee443dac68477d806717c636b73b019c33cd9542ad9a9a8dd'
  checksumType   = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
