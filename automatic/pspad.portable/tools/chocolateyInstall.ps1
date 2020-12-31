$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName	= $ENV:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  file          = Get-Item -path $toolsDir\*.zip

  url			= 'https://www.pspad.com/files/pspad/pspad504en.zip'
  checksumType	= 'sha256'
  checksum		= 'bd257e0fed44242291d548379b89387ad25da5fb2a1350e50b451174650f78c0'
}

# prevent chocolatey from creating shims for supplementary executables
foreach ( $file in 'phpCB.exe', 'TiDy.exe' ) {
  New-Item -path $toolsDir -name "$file.ignore" -type File -force | Out-Null
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "PSPad.lnk"
$targetPath = Join-Path $toolsDir "PSPad.exe"
Install-ChocolateyShortcut -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"
