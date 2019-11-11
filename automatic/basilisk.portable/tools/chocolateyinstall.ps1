$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://eu.basilisk-browser.org/release/basilisk-latest.win32.zip'
  checksum      = 'a67e3a07c94c1159da06a170e68e98eda86b498d78e5037961ae9e2547e9db53'
  checksumType  = 'sha256'
  
  url64         = 'https://eu.basilisk-browser.org/release/basilisk-latest.win64.zip'
  checksum64    = '8e444ab963610bd040aaac95b146831dc4507126e89f34f0301a1600e2ed20a1'
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
