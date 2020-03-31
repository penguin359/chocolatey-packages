$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url64bit      = 'ftp://ftp.cea.fr/pub/salome/targz/SALOME-9.4.0/SALOME-9.4.0-W10.tar.gz'
  checksum64    = '1CD0EA104CDC006B8B4E17DAAC2271C89B2C0A49A8DD4B48F7FE1D5CBA36D8DA'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = "$toolsDir\SALOME-9.4.0.tar"
}
Get-ChocolateyUnzip @packageArgs
Remove-Item $packageArgs.file64

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'SALOME.lnk'
$targetPath       = Join-Path $toolsDir 'SALOME-9.4.0\run_salome.bat'
Install-ChocolateyShortcut -ShortcutFilePath "$shortcutFilePath" -TargetPath "$targetPath"