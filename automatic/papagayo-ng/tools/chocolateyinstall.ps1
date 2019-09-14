$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\PapagayoNG-1.4.2-2017.07.31-65704-win-32bit.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs

# Install start menu shortcut
$path = Get-AppInstallLocation Papagayo-NG
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path "$programs" "Papagayo-NG\Papagayo-NG.lnk"
$targetPath = Join-Path "$path" "papagayo-ng.bat"
$iconPath = Join-Path "$path" "papagayo-ng\papagayo-ng.ico"
Install-ChocolateyShortcut -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath" -iconLocation "$iconPath"