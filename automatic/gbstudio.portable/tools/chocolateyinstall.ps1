$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://github.com/chrismaltby/gb-studio/releases/download/v1.2.1/GB-Studio-Windows-32bit-standalone-1.2.1.zip'
  checksum      = 'A021996F200385171978A2447CFBB3C432904A660625B7B78B8D2CEFDD765C1F'
  checksumType  = 'sha256'

  url64         = 'https://github.com/chrismaltby/gb-studio/releases/download/v1.2.1/GB-Studio-Windows-64bit-standalone-1.2.1.zip'
  checksum64    = 'BF3FA1F3001DF566BD2FC682A3C63B767D6DA15FA8DD8F0F59180DA7A1CAB3A4'
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
