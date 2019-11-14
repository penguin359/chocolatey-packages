$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/ActivityWatch/activitywatch/releases/download/v0.8.3/activitywatch-v0.8.3-windows-x86_64.zip'
  checksum      = '5d051629ba60ccc6f7c513ae31f0018c76add02ce4ccf76f3b6693d8cc27b509'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install in startup menu
$commonStartupDir = [environment]::GetFolderPath([environment+specialfolder]::CommonStartup)
Install-ChocolateyShortcut -ShortcutFilePath "$commonStartupDir\aw-qt.lnk" -TargetPath "$toolsDir\activitywatch\aw-qt.exe"
