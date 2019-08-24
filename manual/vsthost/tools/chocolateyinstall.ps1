$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\vsthostx86.zip"
  file64      = "$toolsDir\vsthostx64.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file,$packageArgs.file64

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

foreach ($exe in 'VSTHost', 'VSTHostBridge32', 'VSTHostBridge64'){
  $shortcutFilePath = Join-Path $programs "${exe}.lnk"
  $targetPath = Join-Path $toolsDir "${exe}.exe"
  Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
}