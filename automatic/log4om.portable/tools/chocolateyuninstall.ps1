$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "LogOMUI.lnk"
if(Test-Path $shortcutFilePath) {
    del $shortcutFilePath
}

$shortcutFilePath = Join-Path $programs "Log4OmCommunicator.lnk"
if(Test-Path $shortcutFilePath) {
    del $shortcutFilePath
}