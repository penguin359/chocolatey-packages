$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/marktext/marktext/releases/download/v0.14.0/marktext-0.14.0.exe'
  fileFullPath  = "$toolsDir\marktext-0.13.65.exe"

  checksum      = 'a9a5024758895fc92a48ed4220091a78475434ff591100d8464ec4a381a07d4c'
  checksumType  = 'sha256'  
}

Get-ChocolateyWebFile @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Mark Text.lnk"
$targetPath = Join-Path $toolsDir "marktext-0.13.65.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
