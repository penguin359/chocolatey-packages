$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "PSPad.lnk"
if(Test-Path $shortcutFilePath) {
    del $shortcutFilePath
}