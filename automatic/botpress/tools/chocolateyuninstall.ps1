$botpressDir = Join-Path $env:ProgramData $env:ChocolateyPackageName
$zipFileName = "botpress-v12_22_0-win-x64.zip"

Uninstall-ChocolateyZipPackage $packageName $zipFileName
# If uninstalling and not just upgrading
# we will remove all node versions that were installed
# and therefore any globally installed modules
if (Test-Path $botpressDir) { Get-ChildItem $botpressDir -Exclude data | Remove-Item -Recurse -Force }

# Delete start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Botpress.lnk"
if(Test-Path $shortcutFilePath) { Remove-Item $shortcutFilePath }
