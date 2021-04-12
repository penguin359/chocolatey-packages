$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PSPad editor'
  fileType       = 'exe'

  url            = 'https://www.pspad.com/files/pspad/pspad506_setup.exe'
  checksum       = 'e1662e3ff91452a9116dd3f249f40c30866f4d81ec57d2f62aafd50a1557246c'
  checksumType   = 'sha256'

  url64          = 'https://www.pspad.com/files/pspad/pspad506_x64_setup.exe'
  checksum64     = '1ce47629049c739140a9f9c7fbb29cd62d112ecd9fe5d7350baca86a633f2da4'
  checksumType64 = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
