$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://eu.basilisk-browser.org/release/basilisk-latest.win32.zip'
  checksum      = 'f63188a715df3f853d95f5025c58cd4bf867008ab9ded7bde798d56a9b47dc43'
  checksumType  = 'sha256'
  
  url64         = 'https://eu.basilisk-browser.org/release/basilisk-latest.win64.zip'
  checksum64    = 'b4cb0d9aea01f4a53dac630353148c748154a458e82e328e75e28422744c0252'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude basilisk.exe
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Basilisk.lnk"
$targetPath = Join-Path $toolsDir "basilisk\basilisk.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
