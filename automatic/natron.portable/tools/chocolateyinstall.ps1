$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url            = 'https://github.com/NatronGitHub/Natron/releases/download/2.3.14/Natron-2.3.14-Windows-x86_32bit-no-installer.zip'
  checksum       = ''
  checksumType   = 'sha256'
  
  url64          = 'https://github.com/NatronGitHub/Natron/releases/download/2.3.14/Natron-2.3.14-Windows-x86_64bit-no-installer.zip'
  checksum64     = ''
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for any executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude "natron.exe"
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$OSArchitectureWidth = Get-OSArchitectureWidth
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Natron.lnk"
$targetPath = Join-Path $toolsDir "Natron-2.3.14-Windows-x86_${OSArchitectureWidth}bit-no-installer\bin\natron.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
