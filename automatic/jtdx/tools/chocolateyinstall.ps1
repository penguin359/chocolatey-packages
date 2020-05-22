$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"    
  file          = "$toolsDir\JTDX-18.0.0.133-GA-win32.zip"  
}

Get-ChocolateyUnzip @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = "$toolsDir\JTDX-18.0.0.133-GA-win32.zip"    
  silentArgs    = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
