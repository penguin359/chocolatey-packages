$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Botpress.lnk"
if(Test-Path $shortcutFilePath) {
    del $shortcutFilePath
}