$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"  

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.9.0/TIB_js-studiocomm_6.9.0_windows_x86_64.zip'
  checksum64     = 'AD99F8186A8BD9446F6DB9F89ED550B14470FE92AE824B5ACCD64684D4BEDAB4'
  checksumType64 = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude "JasperSoft Studio.exe"
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "JasperSoft Studio.lnk"
$targetPath = Join-Path $toolsDir "jaspersoftstudio\JasperSoft Studio.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath