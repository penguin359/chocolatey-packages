$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://downloads.music-group.com/software/behringer/X32/X32-Edit_PC_3.2.zip'
  checksum      = '03772E3C3C3AC90F59062EC672C6F428987B0245700C87B958EBCC534B45DE47'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "X32 Edit.lnk"
$targetPath = Join-Path $toolsDir "X32-Edit.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath