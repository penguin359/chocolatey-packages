$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.dxatlas.com/OmniRig/Files/OmniRig.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  file          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\\OmniRigSetup.exe"

  softwareName  = 'omnirig*'

  checksum      = 'e426c93d55009b201ddca081da82a6fd4cac47c5ace2170cd4f65894d8262379'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
