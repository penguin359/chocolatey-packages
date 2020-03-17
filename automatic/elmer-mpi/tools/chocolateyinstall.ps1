$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file64        = "$toolsDir\elmerfem-mpi-8.4_Windows-AMD64.exe"  
}

Get-ChocolateyUnzip @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file64        = "$toolsDir\redist\MSMpiSetup.exe"
  silentArgs    = '-unattend'
}

Install-ChocolateyInstallPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$OSArchitectureWidth = Get-OSArchitectureWidth
$shortcutFilePath = Join-Path $programs 'Elmer-MPI GUI.lnk'
$targetPath = Join-Path $toolsDir 'bin\ElmerGUI.exe'
Install-ChocolateyShortcut -ShortcutFilePath $shortcutFilePath -TargetPath $targetPath