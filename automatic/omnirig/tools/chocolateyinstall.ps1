$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Omni-Rig *'
  unzipLocation = $toolsDir
  file          = "$toolsDir\OmniRigSetup.exe"  
  fileType      = 'exe'

  url           = 'http://www.dxatlas.com/OmniRig/Files/OmniRig.zip'
  checksum      = 'e426c93d55009b201ddca081da82a6fd4cac47c5ace2170cd4f65894d8262379'
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'  
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs