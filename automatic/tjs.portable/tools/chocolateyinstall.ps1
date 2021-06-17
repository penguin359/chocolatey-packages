$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"  

  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.17.0/TIB_js-studiocomm_6.17.0_windows_x86_64.zip'
  checksum64     = 'd2f602429c75af56cc3ea2a71b5c02a388fbd9d85c1673e093c835373fe8807d'
  checksumType64 = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude 'JasperSoft Studio.exe'
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'JasperSoft Studio.lnk'
$targetPath = Join-Path $toolsDir 'jaspersoftstudio\JasperSoft Studio.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
