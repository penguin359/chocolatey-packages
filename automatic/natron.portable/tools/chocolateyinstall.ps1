$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url64          = 'https://github.com/NatronGitHub/Natron/releases/download/v2.3.15/Natron-2.3.15-Windows-64-no-installer.zip'
  checksum64     = '954df1f1edc9442a315ef0aec6dac0caf3bd58590026fe67a79d779aecbe94e2'
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
$targetPath = Join-Path $toolsDir "Natron-2.3.15-Windows-x86_${OSArchitectureWidth}bit-no-installer\bin\natron.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
