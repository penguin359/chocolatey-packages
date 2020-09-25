$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\dexed-0.9.4-win.zip"
}

Get-ChocolateyUnzip @packageArgs

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName  
  file         = "$toolsDir\dexed-0.9.4hf1-win.exe"
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs