$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName  
  FileFullPath  = "$toolsDir\logisim-evolution.jar"

  url           = 'https://github.com/reds-heig/logisim-evolution/releases/download/v3.4.0/logisim-evolution-3.4.0-all.jar'
  checksum      = '21b23b27b10460763c76ae63b34cfde5abf77c0900683aaee248267475e9879e'
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
