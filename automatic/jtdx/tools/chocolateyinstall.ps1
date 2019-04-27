$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination = $toolsDir
    
  file          = "$toolsDir\JTDX-18.0.0.133-GA-win32.zip"
  checksum      = 'EAD9608470E9B18D61B67D19BAB01A5536F92CE2771459D656A047351556BE79'
  checksumType  = 'sha256'
}

Get-ChocolateyUnzip @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  file          = "$toolsDir\JTDX-18.0.0.133-GA-win32.exe"    
  silentArgs    = "/S"
}

Install-ChocolateyInstallPackage @packageArgs