
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.dxatlas.com/OmniRig/Files/OmniRig.zip'
$url64      = ''

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64
  file          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\\OmniRigSetup.exe"
  file64        = $file

  softwareName  = 'omnirig*'

  checksum      = 'E426C93D55009B201DDCA081DA82A6FD4CAC47C5ACE2170CD4F65894D8262379'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs