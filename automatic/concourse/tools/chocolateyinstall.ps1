$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = "$toolsDir\concourse-5.4.1-windows-amd64.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file64

$installDir = Join-Path $packageArgs.destination $packageArgs.packageName

$flyArgs = @{
  destination    = Join-Path $installDir "bin"
  fileFullPath64 = Join-Path $installDir "fly-assets\fly-windows-amd64.zip"
}

Get-ChocolateyUnzip @flyArgs
Remove-Item -Path $flyArgs.fileFullPath64
