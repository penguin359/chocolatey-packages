$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com/olivierkes/manuskript/releases/download/0.11.0/manuskript-0.11.0-win32.zip'
  checksum      = '5e631677911bd2313945ec7d3117b4ad9ff1f72f7f0a7dc396e3f05c73345996'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

#Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Manuskript.lnk"
$targetPath = Join-Path $toolsDir "manuskript\manuskript.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
