$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\master.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file

Install-BinFile -Name Hosts_Update.cmd -path "$toolsDir\Unified-Hosts-AutoUpdate-master\Hosts_Update.cmd"

Write-Warning 'Run the Hosts_Update.cmd script to begin to use "Unified Hosts AutoUpdate".'