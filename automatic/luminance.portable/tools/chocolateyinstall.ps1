$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file64        = "$toolsDir\Luminance-HDR_v.2.6.0_Windows_64.zip"  
}

# Prevent chocolatey from creating shims for supplementary executables
foreach ( $file in 'gspawn-win64-helper.exe', 'gspawn-win64-helper-console.exe', 'hugin/align_image_stack.exe') {
  New-Item -path $toolsDir\Luminance-HDR_v.2.6.0_Windows_64 -name "$file.ignore" -type File -force | Out-Null
}

Get-ChocolateyUnzip @packageArgs

# Install start menu shortcut
$programs         = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Luminance HDR.lnk"
$targetPath       = Join-Path $toolsDir "Luminance-HDR_v.2.6.0_Windows_64\luminance-hdr.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath