$commonStartupDir = [environment]::GetFolderPath([environment+specialfolder]::CommonStartup)
$FilePath = Join-Path $commonStartupDir "aw-qt.lnk"
if(Test-Path $FilePath) { Remove-Item $Filepath }