$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "upToDate Downloader.lnk"
if(Test-Path $shortcutFilePath) {
  Remove-Item $shortcutFilePath
}