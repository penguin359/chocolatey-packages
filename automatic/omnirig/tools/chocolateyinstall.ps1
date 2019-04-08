$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Omni-Rig *'
  unzipLocation = $toolsDir
  file          = "$toolsDir\OmniRigSetup.exe"  
  fileType      = 'exe'

<<<<<<< HEAD
  url           = 'http://www.dxatlas.com/OmniRig/Files/OmniRig.zip'
  checksum      = 'e426c93d55009b201ddca081da82a6fd4cac47c5ace2170cd4f65894d8262379'
=======
  checksum      = 'be0aba52bcbf6df1b3aa56b51cdeadfc7c955d844cf1cb5099218a1937c296d2'
>>>>>>> e68e6ff0536f77b07b8c892ba54fbbd6682d37c3
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'  
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs