$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = "$toolsDir\concourse-5.4.0-windows-amd64.zip"
}

Get-ChocolateyUnzip @packageArgs

$installDir = Join-Path $packageArgs.destination $packageArgs.packageName

$flyArgs = @{
  File  = Join-Path $installDir "fly-assets\fly-windows-amd64.zip"
  Destination = Join-Path $installDir "bin"
}
Get-ChocolateyUnzip @flyArgs

Remove-Item -Path $packageArgs.file