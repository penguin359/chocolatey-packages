$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  FileFullPath  = "$toolsDir\logisim-evolution.jar"

  url           = 'https://github.com/reds-heig/logisim-evolution/releases/download/v2.15.0/logisim-evolution.jar'
  checksum      = '2D56D01A692E26DD2E5C19A6139ED66D9352FB4BC2C81171B2153B9099CFD91D'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Logisim Evolution.lnk"
$targetPath = Join-Path $toolsDir "logisim-evolution.jar"
$iconLocation = "$toolsDir\logisim-evolution.ico"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath -iconLocation $iconLocation

Write-Warning "You can launch `"Logisim Evolution`" from the start menu."
Write-Warning "Note: Java needs to be installed before using Logisim Evolution."