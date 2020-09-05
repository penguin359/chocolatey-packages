$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"  

<<<<<<< HEAD
  url64          = 'https://downloads.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.13.0/TIB_js-studiocomm_6.13.0_windows_x86_64.zip'
  checksum64     = 'b2a3b099c1ef5ff2c7fcc92aed1fbe8b52883a81528e34a16502c4b0b1a583af'
=======
  url64          = 'https://netcologne.dl.sourceforge.net/project/jasperstudio/JaspersoftStudio-6.14.0/TIB_js-studiocomm_6.14.0_windows_x86_64.zip'
  checksum64     = '13432f7445311a03c95a8ea39ce36e399afa73fac3e8a63d82085ddbf9ee51f8'
>>>>>>> 7aefcc97b55bc0e28a6f3e842c935e3affd623b1
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