$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/ActivityWatch/activitywatch/releases/download/v0.9.1/activitywatch-v0.9.1-windows-x86_64.zip'
  checksum      = 'c5a099e2fc91add87f876321548f49a477673bac112a7b403f15663916de811d'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install in startup menu
$commonStartupDir = [environment]::GetFolderPath([environment+specialfolder]::CommonStartup)
Install-ChocolateyShortcut -ShortcutFilePath "$commonStartupDir\aw-qt.lnk" -TargetPath "$toolsDir\activitywatch\aw-qt.exe"
