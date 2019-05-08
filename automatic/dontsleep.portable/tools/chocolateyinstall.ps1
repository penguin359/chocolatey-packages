$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\DontSleep_Portable.zip"
  file64        = "$toolsDir\DontSleep_x64_Portable.zip"  
}

Get-ChocolateyUnzip @packageArgs
    
#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
if (Get-OSArchitectureWidth -Compare "32") { $exe_file = "DontSleep_p.exe" } else { $exe_file = "DontSleep_x64_p.exe" }

$shortcutFilePath = Join-Path $programs "Dont Sleep.lnk"
$targetPath = Join-Path $toolsDir $exe_file
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
