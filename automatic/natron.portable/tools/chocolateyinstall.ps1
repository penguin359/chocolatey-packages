$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url            = 'https://github.com/NatronGitHub/Natron/releases/download/2.3.14/Natron-2.3.14-Windows-x86_32bit-no-installer.zip'
  checksum       = '3d119398063e3f8f5bc5126a65483cdd5363b2db94ee7460c7bd96e353e432ea'
  checksumType   = 'sha256'
  
  url64          = 'https://github.com/NatronGitHub/Natron/releases/download/2.3.14/Natron-2.3.14-Windows-x86_64bit-no-installer.zip'
  checksum64     = 'b693dceeb564420964030175060488241d4745f42c7b7796aaaeb90e7f152a3c'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for any executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude "natron.exe"
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Natron.lnk"
$targetPath = Join-Path $toolsDir "Natron-2.3.14-Windows-x86_64bit-no-installer\bin\natron.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath