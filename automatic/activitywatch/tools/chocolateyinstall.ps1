$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/ActivityWatch/activitywatch/releases/download/v0.8.0b9/activitywatch-v0.8.0b9-windows-x86_64.zip'
  checksum      = '628ab0a0f9a4edf198291ef281a53ca105f956e4cada9e968c67fb205a4aa439'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install in startup menu
$commonStartupDir = [environment]::GetFolderPath([environment+specialfolder]::CommonStartup)
Install-ChocolateyShortcut -ShortcutFilePath "$commonStartupDir\aw-qt.lnk" -TargetPath "$toolsDir\activitywatch\aw-qt.exe"
