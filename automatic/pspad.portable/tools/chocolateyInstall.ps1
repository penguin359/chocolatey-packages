$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName	= $ENV:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  file          = Get-Item -path $toolsDir\*.zip

  url			= 'https://www.pspad.com/files/pspad/pspad502en.zip'
  checksumType	= 'sha256'
  checksum		= '5DABB55F90A8D727ED0479E66AE81159D581B49AE55CAABED22569AE66A03F0D'
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
