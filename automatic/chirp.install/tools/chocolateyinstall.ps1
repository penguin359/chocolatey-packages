$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  fileType      = 'exe'
  file          = "$toolsDir\chirp-daily-20200807-installer.exe"
  silentArgs    = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
