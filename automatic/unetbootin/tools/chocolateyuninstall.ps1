$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "UNetbootin.lnk"
if(Test-Path $shortcutFilePath) {
    del $shortcutFilePath
}