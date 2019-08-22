$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName"
  destination   = "$toolsDir"    
  file          = "$toolsDir\VirtualDub2_43786.zip"  
}

# Shims
if (Get-OSArchitectureWidth -Compare "32"){
  foreach ( $file in 'vdub64.exe', 'VirtualDub64.exe'){
    New-Item -path $toolsDir -name "$file.ignore" -type File -force | Out-Null
  }
} else {
  foreach ( $file in 'vdub.exe', 'VirtualDub.exe'){
    New-Item -path $toolsDir -name "$file.ignore" -type File -force | Out-Null
  }
}
foreach ( $file in 'auxsetup.exe', 'vdlaunch.exe', 'vdlaunch64.exe'){
  New-Item -path $toolsDir\extra -name "$file.ignore" -type File -force | Out-Null
}

Get-ChocolateyUnzip @packageArgs
    
# Install start menu shortcut
if (Get-OSArchitectureWidth -Compare "32") { $exe_file = "VirtualDub.exe" } else { $exe_file = "VirtualDub64.exe" }
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "VirtualDub2.lnk"
$targetPath = Join-Path $toolsDir "$exe_file"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
