$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file64        = "$toolsDir\elmerfem-8.4_Windows-AMD64.exe"  
}

#Install-ChocolateyInstallPackage @packageArgs
Get-ChocolateyUnzip @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$OSArchitectureWidth = Get-OSArchitectureWidth
$shortcutFilePath = Join-Path $programs 'Elmer GUI.lnk'
$targetPath = Join-Path $toolsDir 'bin\ElmerGUI.exe'
Install-ChocolateyShortcut -ShortcutFilePath $shortcutFilePath -TargetPath $targetPath