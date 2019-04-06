$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'http://www.log4om.com/log4om/release/Log4OM_1_36_0.zip'
  file          = "$toolsDir\\Log4OM_1_36_0.exe"
  softwareName  = 'Log4OM'

  checksum      = '153f7ee37793483bec0c49eab574a22ff38c742da6c7fc32ad4ab3508e83269b'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs