$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\nip2-8.7.0-setup.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName  
  fileFullPath = "$toolsDir\nip2-8.7.0-setup.exe"
  silentArgs   = '/S'
}

Install-ChocolateyInstallPackage @packageArgs