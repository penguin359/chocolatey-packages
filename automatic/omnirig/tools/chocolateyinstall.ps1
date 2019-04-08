$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Omni-Rig *'
  unzipLocation = $toolsDir
  file          = "$toolsDir\OmniRigSetup.exe"  
  fileType      = 'exe'

  url           = 'http://www.dxatlas.com/OmniRig/Files/OmniRig.zip'
  checksum      = 'be0aba52bcbf6df1b3aa56b51cdeadfc7c955d844cf1cb5099218a1937c296d2'
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'  
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
