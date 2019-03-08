$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Kdevelop.lnk"
if(Test-Path $shortcutFilePath) {
    del $shortcutFilePath
}