$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PSPad editor'
  unzipLocation  = "$toolsDir"
  fileType       = 'exe'

  url            = 'https://www.pspad.com/files/pspad/pspad501_setup.exe'
  checksum       = 'DBBD1B7044D925744FE9A873C181CAA2F6F931E02BB316C1A9D08659110C7BDD'
  checksumType   = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
Remove-Item -Path "$toolsDir\pspad*setup.exe" -ErrorAction SilentlyContinue