$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName	= 'CHIRP'
  fileType		= 'exe'
  file          = "$toolsDir\chirp-daily-20190429-installer.exe"
  silentArgs = '/S'
}

Install-ChocolateyInstallPackage @packageArgs