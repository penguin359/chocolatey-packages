$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\dexed-0.9.4-win.zip"
}

Get-ChocolateyUnzip @packageArgs

$exe_file = (gci $toolsDir\dexed-*-win.exe).name

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName  
  file         = "$toolsDir\$exe_file"
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs
