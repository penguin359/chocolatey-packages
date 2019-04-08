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

  checksum      = 'be0aba52bcbf6df1b3aa56b51cdeadfc7c955d844cf1cb5099218a1937c296d2'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
