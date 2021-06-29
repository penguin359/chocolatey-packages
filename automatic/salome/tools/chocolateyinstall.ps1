$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url64         = 'https://www.salome-platform.org/downloads/current-version/DownloadDistr?platform=SP.W10EXE&amp;version=9.7.0'
  checksum64    = '7589d92196fb7254506feed34a052d5e24bf7826c84d369081a0b7c2ea658ed8'
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
