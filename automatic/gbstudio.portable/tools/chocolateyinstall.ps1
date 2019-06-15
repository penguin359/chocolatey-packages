$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = "https://github.com/chrismaltby/gb-studio/releases/download/v1.1.0/GB.Studio-win32-ia32-1.1.0.zip"
  checksum      = 'D4B32C095BB13B0F5AEA23AF54A626C6BA02EC0FE59FC3B273B491B3CE97E8DB'
  checksumType  = 'sha256'

  url64         = "https://github.com/chrismaltby/gb-studio/releases/download/v1.1.0/GB.Studio-win32-x64-1.1.0.zip"
  checksum64    = 'F471AFA9254ECB628CFC9851D7946FC70263A92CC6880CE41D252688089DEFC4'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Prevent chocolatey from creating shims for supplementary executables
New-Item -path $toolsDir -name "Update.exe.ignore" -type File -force | Out-Null

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "GB Studio.lnk"
$targetPath = Join-Path $toolsDir "gb-studio.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath