$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://eu.basilisk-browser.org/release/basilisk-latest.win32.zip'
  checksum      = 'cf43fa119abea7381927163bf359a0b6e0ce27ca4880d4c89438a789c285ea9e'
  checksumType  = 'sha256'
  
  url64         = 'https://eu.basilisk-browser.org/release/basilisk-latest.win64.zip'
  checksum64    = '674a5272f1fe215211acb5dc6da0ed7b749dfb74c4d0733ea6922625f5745643'
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
