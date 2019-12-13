$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url            = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_portable.zip'
  checksum       = '555457b40269ca12030569d04622338a02b191049d7998f5e93de1ab3194bb53'
  checksumType   = 'sha256'

  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio64_portable.zip'
  checksum64     = '8b5af69fa33e7451d92d449425915076bfc81ca8d88de52494bb44873de8d3bf'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Ocenaudio.lnk"
$targetPath = Join-Path $toolsDir "ocenaudio.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
