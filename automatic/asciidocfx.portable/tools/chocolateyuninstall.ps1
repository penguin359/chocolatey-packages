$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "AsciidocFX.lnk"
if (Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }