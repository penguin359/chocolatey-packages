$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\gtools-current.exe"
  silentArgs	= "/S"
}

Install-ChocolateyInstallPackage @packageArgs
Install-ChocolateyPath -PathToInstall "${env:ProgramFiles(x86)}\p-nand-q.com\GTools"