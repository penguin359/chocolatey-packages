$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = 'https://github.com/marktext/marktext/releases/download/v0.13.65/marktext-0.13.65.exe'
  fileFullPath  = "$toolsDir\marktext-0.13.65.exe"

  checksum      = 'FB0B9527A172E600CB73A786C9F1498333083B5AC8A8C14D321502DF4706DDA8'
  checksumType  = 'sha256'
  
  silentArgs	= "/S _?=$Env:PROGRAMFILES\$packageName"
}

Get-ChocolateyWebFile @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Mark Text.lnk"
$targetPath = Join-Path $toolsDir "marktext-0.13.65.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath