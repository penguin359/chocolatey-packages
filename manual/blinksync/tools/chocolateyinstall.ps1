$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\BlinkSync-1.02-setup.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
Install-BinFile -Name blinksync -Path ${env:ProgramFiles(x86)}\BlinkSync\blinksync.exe