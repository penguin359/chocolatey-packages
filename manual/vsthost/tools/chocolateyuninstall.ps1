# Remove start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

foreach ($exe in 'VSTHost', 'VSTHostBridge32', 'VSTHostBridge64'){
  $shortcutFilePath = Join-Path $programs "${exe}.lnk"
  if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }
}