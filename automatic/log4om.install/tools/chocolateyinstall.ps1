$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\Log4OM_1_37_0.zip"  
}
Get-ChocolateyUnzip @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = "$toolsDir\Log4OM_1_37_0.zip"
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}
Install-ChocolateyInstallPackage @packageArgs
