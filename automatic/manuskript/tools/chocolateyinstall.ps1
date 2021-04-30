$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com/olivierkes/manuskript/releases/download/0.12.0/manuskript-0.12.0-win32.zip'
  checksum      = '60f183e8c5d256a7777f5ed8b7cbbca6cb148f2acafb3a4b32b5ed1d76c73178'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Manuskript.lnk"
$targetPath = Join-Path $toolsDir "manuskript\manuskript.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
