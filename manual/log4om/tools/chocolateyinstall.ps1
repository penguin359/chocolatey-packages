$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.log4om.com/log4om/release/Log4OM_1_36_0.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  file          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\\Log4OM_1_36_0.exe"
  defaultName	= "Log4OM_1_36_0.zip"

  softwareName  = 'log4om*'

  checksum      = '153F7EE37793483BEC0C49EAB574A22FF38C742DA6C7FC32AD4AB3508E83269B'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs