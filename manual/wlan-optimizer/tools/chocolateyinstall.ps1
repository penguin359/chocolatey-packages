$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'http://www.martin-majowski.de/downloads/wopt021.zip'
  checksum      = 'DBB718FCCE5354D332F818DC1077B691C31886D3741C98CA4124ECDBA53123DA'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "WLAN Optimizer.lnk"
$targetPath = Join-Path $toolsDir "WLAN Optimizer.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath